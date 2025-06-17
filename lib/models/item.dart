import 'package:costculator/models/ingredient.dart';
import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 3)
class UsedIngredients {
  @HiveField(0)
  Ingredient ingredient;
  @HiveField(1)
  double amount;

  //constructor
  UsedIngredients({required this.ingredient, required this.amount});
}

@HiveType(typeId: 2)
class Item {
  //Properties
  @HiveField(0)
  String name;
  @HiveField(1)
  List<UsedIngredients> ingredientsUsed;

  //Constructor
  Item({required this.name, required this.ingredientsUsed});

  //Getter methods
  double get cost {
    double total = 0;
    for (var used in ingredientsUsed) {
      total +=
          used.ingredient.unitPrice *
          used.amount *
          (1 + used.ingredient.profitPercent / 100);
    }
    return total;
  }

  double get price {
    double total = 0;
    for (var used in ingredientsUsed) {
      total += used.ingredient.unitPrice * used.amount;
    }
    return total;
  }
}
