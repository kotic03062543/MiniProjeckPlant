import 'package:flutter/material.dart';

class PoppuLar extends StatefulWidget {
  static const routeName = '/';
  PoppuLar({Key? key}) : super(key: key);

  @override
  State<PoppuLar> createState() => _PoppuLarState();
}

class _PoppuLarState extends State<PoppuLar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Favorite')),
    );
  }
}
