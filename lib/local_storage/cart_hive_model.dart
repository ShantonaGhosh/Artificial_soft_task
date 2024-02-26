import 'package:hive_flutter/hive_flutter.dart';
part 'cart_hive_model.g.dart';

@HiveType(typeId: 0)
class CartHiveModel extends HiveObject {
  @HiveField(0)
  int? productId;
  @HiveField(1)
  String? productName;
  @HiveField(2)
  int? categoryId;
  @HiveField(3)
  String? categoryName;

  CartHiveModel({
     this.productId,
     this.productName,
     this.categoryId,
     this.categoryName,
  });
}
