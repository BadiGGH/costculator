import 'package:costculator/models/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class IngredientPage extends StatefulWidget {
  @override
  _IngredientPageState createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  //Define ingredient box
  late Box<Ingredient> ingredientBox;

  //Open ingredient box
  @override
  void initState() {
    super.initState();
    ingredientBox = Hive.box<Ingredient>('ingredients');
  }

  void _showAddIngredientDialog() {
    final _formKey = GlobalKey<FormState>();
    String name = '';
    double unitPrice = 0.0;
    double profitPercent = 0.0;
    Unit selectedUnit = Unit.kilogram;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Ingredient'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //name
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onSaved: (value) => name = value!.trim(),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter a name'
                        : null,
                  ),
                  // Price per unit
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Price per unit'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) =>
                        unitPrice = double.tryParse(value!) ?? 0.0,
                    validator: (value) => double.tryParse(value!) == null
                        ? 'Enter a valid price'
                        : null,
                  ),
                  // Profit percent
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Profit %'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) =>
                    profitPercent = double.tryParse(value!) ?? 0.0,
                    validator: (value) =>
                    double.tryParse(value!) == null ? 'Enter a valid percent' : null,
                  ),
                  // Unit
                  DropdownButtonFormField(
                      decoration: InputDecoration(labelText: 'Unit'),
                      value: selectedUnit,
                      items: Unit.values.map((unit) {
                        return DropdownMenuItem(
                          value: unit,
                          child: Text(unit.name),
                        );
                      }).toList(),
                      onChanged: (value) => selectedUnit = value!
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();

                  final newIngredient = Ingredient(
                      name: name,
                      unitPrice: unitPrice,
                      profitPercent: profitPercent,
                      unit: selectedUnit
                  );
                  Hive.box<Ingredient>('ingredients').add(newIngredient);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingredients')),
      body: ValueListenableBuilder(
        valueListenable: ingredientBox.listenable(),
        builder: (context, Box<Ingredient> box, _) {
          if (box.isEmpty) {
            return Center(child: Text("No ingredients yet!"));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final ingredient = box.getAt(index)!;
              return ListTile(
                title: Text(ingredient.name),
                subtitle: Text(
                  '${ingredient.unitPrice.toStringAsFixed(2)} per ${ingredient.unit.name}',
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddIngredientDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
