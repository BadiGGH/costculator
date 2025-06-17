import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: Center(child: Text('No items yet')), // for now
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // open add dialog later
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
