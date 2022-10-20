// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ProFile extends StatefulWidget {
  final String user_id;
  ProFile({Key? key, required  this.user_id}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ProFile'),
    );
  }
}