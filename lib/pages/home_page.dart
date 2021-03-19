import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_week6/models/item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputName = new TextEditingController();
  TextEditingController inputPrice = new TextEditingController();
  TextEditingController inputQty = new TextEditingController();

  List<Item> items = [];

  void _showcontent(int index) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Remove Item'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Are you sure to remove item?'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('YES'),
              onPressed: () {
                Navigator.of(context).pop();
                _removeItemToList(index);
              },
            ),
            new FlatButton(
              child: new Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _removeItemToList(int idx) {
    setState(() {
      items.removeAt(
          idx); // remove item from list with passing index value to parameter
    });
  }

  void showBottomSheet() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 300,
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
                  TextFormField(
                    controller: inputQty,
                    decoration: InputDecoration(
                      labelText: "Item Qty",
                      hintText: "Insert item qty",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    child: const Text('Add Item'),
                    onPressed: () {
                      setState(() {
                        items.add(Item(
                            name: inputName.text,
                            price: int.parse(inputPrice.text),
                            qty: int.parse(inputQty.text)));
                        inputName.clear();
                        inputPrice.clear();
                        inputQty.clear();
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
                  onLongPress: () {
                    _showcontent(index);
                  },
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
