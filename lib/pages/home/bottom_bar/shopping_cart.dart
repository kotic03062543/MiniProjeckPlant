// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShopCart extends StatefulWidget {
  static const routeName = '/';

  const ShopCart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<ShopCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Cart')),
    );
  }
}
