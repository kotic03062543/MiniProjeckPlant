import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fluttermysql/pages/adduser.dart';
// import 'package:fluttermysql/pages/edituser.dart';
// import 'package:fluttermysql/pages/login.dart';
// import 'package:fluttermysql/pages/profile.dart';
import 'package:http/http.dart' as http;

class EditProFile extends StatefulWidget {
  static const routeName = '/';
  final String id;

  const EditProFile({super.key, required this.id});
  @override
  _State createState() => _State();
}

class _State extends State<EditProFile> {
  @override
  void initState() {
    super.initState();
    getmember();
  }


  Future getmember() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
    var response1 = await http.post(url, body: {
      'user_id': widget.id,
    });
    var data = jsonDecode(response1.body);
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('EditProFile'),
    );
  }
}
