import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Costculator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Ingredients'),
              onPressed: () {
                Navigator.pushNamed(context, '/ingredients');
              },
            ),
            ElevatedButton(
              child: Text('Items'),
              onPressed: () {
                Navigator.pushNamed(context, '/items');
              },
            ),
          ],
        ),
      ),
    );
  }
}
