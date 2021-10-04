import 'package:get_builder_state_management_getx/utils/export.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  final String? productTitle;
  @HiveField(1)
  final String? productImage;
  @HiveField(2)
  final double? productPrice;

  CartModel({
    this.productTitle,
    this.productImage,
    this.productPrice,
  });
}
