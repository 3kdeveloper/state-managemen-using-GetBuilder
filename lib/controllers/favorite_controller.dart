import 'package:get_builder_state_management_getx/utils/export.dart';

class FavoriteController extends GetxController {
  final productCntrolr = Get.find<ProductController>();
  void addToFavorite(int index) {
    final favoriteBox = Hive.box<FavoriteModel>('favourite');
    final favorite = FavoriteModel(
      productTitle: productCntrolr.products[index].productName,
      productImage: productCntrolr.products[index].productImage!,
      productPrice: productCntrolr.products[index].price!,
    );
    if (favoriteBox.containsKey(productCntrolr.products[index].id)) {
      deleteFromFavorite(index);
    } else {
      favoriteBox.put(productCntrolr.products[index].id, favorite);
    }
  }

  void deleteFromFavorite(int index) {
    Hive.box<FavoriteModel>('favourite').deleteAt(index);
  }
}
