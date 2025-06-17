import 'package:costculator/pages/home_page.dart';
import 'package:costculator/pages/ingredient_page.dart';
import 'package:costculator/pages/item_page.dart';
import 'package:costculator/models/ingredient.dart';
import 'package:costculator/models/item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Hive
  await Hive.initFlutter();

  //Register adapters
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(UsedIngredientsAdapter());
  Hive.registerAdapter(UnitAdapter());

  //Open Hive boxes
  await Hive.openBox<Ingredient>('ingredients');
  await Hive.openBox<Item>('items');

  //Run the app
  runApp(
    MaterialApp(
      title: 'Costculator',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/ingredients': (context) => IngredientPage(),
        '/items': (context) => ItemPage(),
      },
    ),
  );
}
