class Product {
  final String id;
  final String productName;
  final String? prodcutDescription;
  final String? productImage;
  final double? price;
  bool isFavorite;
  Product({
    required this.id,
    required this.productName,
    this.prodcutDescription,
    this.productImage,
    this.price,
    this.isFavorite = false,
  });
}
