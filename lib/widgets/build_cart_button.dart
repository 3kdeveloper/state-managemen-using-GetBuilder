import 'package:get_builder_state_management_getx/utils/export.dart';

final _productCntrolr = Get.find<ProductController>();
final _cartCntrolr = Get.find<CartController>();

ValueListenableBuilder<Box<CartModel>> buildCartButton(int index) {
  return ValueListenableBuilder(
      valueListenable: Hive.box<CartModel>('cart').listenable(),
      builder: (context, box, _) {
        final cartBox = Hive.box<CartModel>('cart');
        return cartBox.containsKey(_productCntrolr.products[index].id)
            ? TextButton(
                onPressed: () => Get.to(const CartScreen()),
                child: const Text('go to cart'))
            : IconButton(
                onPressed: () {
                  _cartCntrolr.addToCart(index);
                },
                icon: Icon(
                  cartBox.containsKey(_productCntrolr.products[index].id)
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  color: cartBox.containsKey(_productCntrolr.products[index].id)
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
      });
}
