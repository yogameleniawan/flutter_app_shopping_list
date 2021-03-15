import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_week6/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Center(
        child: Text(itemArgs.name + " with " + itemArgs.price.toString()),
      ),
    );
  }
}
