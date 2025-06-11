import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Costculator"),
        actions: [
          IconButton(
            onPressed: () {
              print("Menu tapped");
            },
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Items");
                },
                child: const Text("Items"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Ingredients");
                },
                child: const Text("Ingredients"),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
