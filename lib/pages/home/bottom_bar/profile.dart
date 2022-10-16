import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fluttermysql/pages/adduser.dart';
// import 'package:fluttermysql/pages/edituser.dart';
// import 'package:fluttermysql/pages/login.dart';
// import 'package:fluttermysql/pages/profile.dart';
import 'package:http/http.dart' as http;

class ProFile extends StatefulWidget {
  static const routeName = '/';
  @override
  _State createState() => _State();
}

class _State extends State<ProFile> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future getdata() async {
    // var url = "https://pattyteacher.000webhostapp.com/select.php";
    var url = Uri.parse("http://10.0.2.2/connectPHP/select.php");
    var response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Profile'),
    );
  }
}
