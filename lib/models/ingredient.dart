import 'package:hive/hive.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 0)
class Ingredient {

  @HiveField(0)
  String name;

  @HiveField(1)
  double unitPrice;

  @HiveField(2)
  double profitPercent;

  @HiveField(3)
  Unit unit;
  //Constructor
  Ingredient({
   required this.name,
   required this.unitPrice,
   required this.profitPercent,
   required this.unit,
});
}

@HiveType(typeId: 1)
enum Unit {

  @HiveField(0)
  kilogram,

  @HiveField(1)
  liter,

  @HiveField(2)
  quantity,
}