import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_week6/models/item.dart';
import 'package:pemrograman_mobile_week6/swipedetector.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Item> items = [
  //   Item(name: 'Sugar', price: 5000),
  //   Item(name: 'Salt', price: 2000),
  // ];
  TextEditingController inputName = new TextEditingController();
  TextEditingController inputPrice = new TextEditingController();

  List<Item> items = [];

  void showBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 200,
            margin: EdgeInsets.only(left: 10, right: 10),
            // color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.expand_more_outlined),
                  TextFormField(
                    controller: inputName,
                    decoration: InputDecoration(
                      labelText: "Item Name",
                      hintText: "Insert item name",
                    ),
                  ),
                  TextFormField(
                    controller: inputPrice,
                    decoration: InputDecoration(
                      labelText: "Item Price",
                      hintText: "Insert item price",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    child: const Text('Add Item'),
                    onPressed: () {
                      setState(() {
                        items.add(Item(
                            name: inputName.text,
                            price: int.parse(inputPrice.text)));
                        inputName.clear();
                        inputPrice.clear();
                      });
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                showBottomSheet();
              }),
        ],
      ),
      body: Container(
          margin: EdgeInsets.all(8),
          child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(child: Text(item.name)),
                          Expanded(
                            child: Text(item.price.toString(),
                                textAlign: TextAlign.end),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
