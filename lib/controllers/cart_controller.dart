import 'package:get_builder_state_management_getx/utils/export.dart';

class CartController extends GetxController {
  final productCntrolr = Get.find<ProductController>();
  void addToCart(int index) {
    final cartBox = Hive.box<CartModel>('cart');
    final cart = CartModel(
      productTitle: productCntrolr.products[index].productName,
      productImage: productCntrolr.products[index].productImage,
      productPrice: productCntrolr.products[index].price,
    );
    if (cartBox.containsKey(productCntrolr.products[index].id)) {
      deleteFromCart(index);
    } else {
      cartBox.put(productCntrolr.products[index].id, cart);
    }
  }

  void deleteFromCart(int index) {
    Hive.box<CartModel>('cart').deleteAt(index);
  }
}
