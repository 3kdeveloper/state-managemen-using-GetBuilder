import 'package:get_builder_state_management_getx/utils/export.dart';
part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final String productTitle;
  @HiveField(1)
  final String productImage;
  @HiveField(2)
  final double productPrice;

  FavoriteModel({
    required this.productTitle,
    required this.productImage,
    required this.productPrice,
  });
}
