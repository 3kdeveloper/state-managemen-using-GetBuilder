import 'package:get_builder_state_management_getx/utils/export.dart';

class ProductController extends GetxController {
  List<Product> products = [];

  fetchProductData() async {
    await Future.delayed(const Duration(seconds: 5));
    List<Product> productsData = [
      Product(
        id: 1,
        price: 499,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productName: 'T-Shirt',
      ),
      Product(
        id: 2,
        price: 799,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/shoes.jpg',
        productName: 'Shoes',
      ),
      Product(
        id: 3,
        price: 1000,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/jeans.png',
        productName: 'Jeans',
      ),
    ];

    products.assignAll(productsData);
  }
}
