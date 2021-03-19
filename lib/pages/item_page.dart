import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_week6/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = ModalRoute.of(context).settings.arguments;
    int hasil = itemArgs.price * itemArgs.qty;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text("Item Name : " + itemArgs.name)),
                  Expanded(
                    child: Text("Total Price : " + itemArgs.price.toString(),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Item Qty :  " + itemArgs.qty.toString(),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Total Price : ",
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                    child: Text(
                        "Rp. " + (itemArgs.price * itemArgs.qty).toString(),
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
