import 'package:get/get.dart';
import 'package:get_builder_state_management_getx/models/product_model.dart';

class ProductController extends GetxController {
  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async {
    await Future.delayed(const Duration(seconds: 5));
    List<Product> productsData = [
      Product(
        id: 1,
        price: 49,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productName: 'T-Shirt',
      ),
      Product(
        id: 2,
        price: 99,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/shoes.jpg',
        productName: 'Shoes',
      ),
      Product(
        id: 3,
        price: 100,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/jeans.png',
        productName: 'Jeans',
      ),
      Product(
        id: 1,
        price: 49,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productName: 'T-Shirt',
      ),
      Product(
        id: 2,
        price: 99,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/shoes.jpg',
        productName: 'Shoes',
      ),
      Product(
        id: 3,
        price: 100,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/jeans.png',
        productName: 'Jeans',
      ),
      Product(
        id: 1,
        price: 49,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/Blue_Tshirt.jpg',
        productName: 'T-Shirt',
      ),
      Product(
        id: 2,
        price: 99,
        prodcutDescription: 'some description about product',
        productImage: 'assets/images/shoes.jpg',
        productName: 'Shoes',
      ),
    ];
    products.assignAll(productsData);
    update();
  }
}
