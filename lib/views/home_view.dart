import 'package:get_builder_state_management_getx/utils/export.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final productController = Get.lazyPut(() => ProductController());
  final productCntrolr = Get.find<ProductController>();

  void addToFavorite(int index) {
    final favorite = FavoriteModel(
      productTitle: productCntrolr.products[index].productName,
      productImage: productCntrolr.products[index].productImage!,
      productPrice: productCntrolr.products[index].price!,
    );
    Hive.box<FavoriteModel>('favourite')
        .put(productCntrolr.products[index].id, favorite);
  }

  void deleteFromFavorite(int index) {
    Hive.box<FavoriteModel>('favourite').deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Explore Your Favorite Products'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.to(const FavoriteScreen()),
                icon: const Icon(Icons.favorite, color: Colors.red)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: GetBuilder<ProductController>(builder: (controller) {
          return GridView.builder(
            padding: const EdgeInsets.only(
              left: 5.0,
              right: 5.0,
              top: 10.0,
              bottom: 10.0,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: constrains.maxHeight * 0.6,
                            child: Image.asset(
                                controller.products[index].productImage!),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          controller.products[index].productName,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(height: constrains.maxHeight * 0.01),
                        ValueListenableBuilder(
                            valueListenable:
                                Hive.box<FavoriteModel>('favourite')
                                    .listenable(),
                            builder: (context, box, _) {
                              final favoriteBox =
                                  Hive.box<FavoriteModel>('favourite');
                              return Row(
                                children: [
                                  Text(
                                    '\$ ${controller.products[index].price.toString()}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      // deleteFromFavorite(index);

                                      addToFavorite(index);
                                    },
                                    icon: Icon(
                                      favoriteBox.containsKey(
                                              productCntrolr.products[index].id)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: favoriteBox.containsKey(
                                              productCntrolr.products[index].id)
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   // icon: const Icon(
                                  //   //   box.keyAt(index) != null
                                  //   //       ? Icons.shopping_cart_outlined
                                  //   //       : Icons.shopping_cart,
                                  //   // ),
                                  // ),
                                ],
                              );
                            }),
                      ],
                    );
                  },
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: Get.height * 0.25,
            ),
          );
        }));
  }
}
