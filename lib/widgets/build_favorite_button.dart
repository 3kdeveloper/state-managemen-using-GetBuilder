import 'package:get_builder_state_management_getx/utils/export.dart';

final _productCntrolr = Get.find<ProductController>();
final _favoriteCntrolr = Get.find<FavoriteController>();

ValueListenableBuilder<Box<FavoriteModel>> buildFavoriteButton(int index) {
  return ValueListenableBuilder(
      valueListenable: Hive.box<FavoriteModel>('favourite').listenable(),
      builder: (context, box, _) {
        final favoriteBox = Hive.box<FavoriteModel>('favourite');
        return IconButton(
          onPressed: () {
            _favoriteCntrolr.addToFavorite(index);
          },
          icon: Icon(
            favoriteBox.containsKey(_productCntrolr.products[index].id)
                ? Icons.favorite
                : Icons.favorite_outline,
            color: favoriteBox.containsKey(_productCntrolr.products[index].id)
                ? Colors.red
                : Colors.grey,
          ),
        );
      });
}
