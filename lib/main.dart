import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_week6/pages/home_page.dart';
import 'pages/item_page.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => HomePage(),
    '/item': (context) => ItemPage(),
  }));
}
