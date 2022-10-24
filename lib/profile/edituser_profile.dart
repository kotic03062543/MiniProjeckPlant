// ignore_for_file: unnecessary_new, library_private_types_in_public_api, prefer_const_constructors, unused_import, avoid_print, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/pages/home/bottom_bar/home.dart';
import 'package:myfirstapp/pages/home/bottom_bar/profile.dart';
import 'package:myfirstapp/profile/edit_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:myfirstapp/until/colors.dart';

class EditUserProfile extends StatefulWidget {
  final int index;
  final String user_id;
  final List list;

  EditUserProfile(
      {Key? key,
      required this.user_id,
      required this.list,
      required this.index})
      : super(key: key);

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  TextEditingController user_id = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController fullname = new TextEditingController();
  TextEditingController user_email = new TextEditingController();
  TextEditingController user_address = new TextEditingController();
  TextEditingController user_pic = new TextEditingController();

  bool editMode = false;
  Future editUser() async {
    if (editMode) {
      // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
      var url =
          Uri.parse("https://plantyshop.vitinias.com/connectPHP/insert.php");
      await http.post(url, body: {
        //'id' : widget.list[widget.index]['id'],
        'user_id': user_id.text,
        'username': username.text,
        'password': password.text,
        'fullname': fullname.text,
        'user_email': user_email.text,
        'user_address': user_address.text,
        'user_pic': user_pic.text,
      });
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Home(),
      //   ),
      // );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      user_id.text = widget.list[widget.index]['user_id'];
      username.text = widget.list[widget.index]['username'];
      password.text = widget.list[widget.index]['password'];
      fullname.text = widget.list[widget.index]['fullname'];
      user_email.text = widget.list[widget.index]['user_email'];
      user_address.text = widget.list[widget.index]['user_address'];
      user_pic.text = widget.list[widget.index]['user_pic'];
    }
    // print('product' + product_id.text);
    // addorder();
    print('User' + widget.user_id);
    // getmember();
    // addorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Launcher(user_id: widget.user_id)));
          },
          icon: Icon(
            FontAwesomeIcons.circleChevronLeft,
            color: Colors.grey[850],
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 45),
            child: Text(
              "Edit Profile",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.lime[900]),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: user_pic,
                          decoration: new InputDecoration(
                            hintText: "User_pic",
                            labelText: "User_pic",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: user_id,
                          decoration: new InputDecoration(
                            hintText: "User_id",
                            labelText: "User_id",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        // ignore: dead_code
                        TextField(
                          controller: username,
                          // enabled: false,
                          decoration: new InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: fullname,
                          // obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Fullname",
                            labelText: "Fullname",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: user_email,
                          // obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: user_address,
                          // obscureText: true,
                          decoration: new InputDecoration(
                            hintText: "Address",
                            labelText: "Address",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GFButton(
                          padding: EdgeInsets.only(left: 100, right: 100),
                          onPressed: () {
                            editUser();
                          },
                          text: "UPDATE",
                          size: GFSize.LARGE,
                          color: AppColors.maincolor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: AppColors.maincolor,
        width: 3,
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: AppColors.limecolor,
        width: 3,
      ),
    );
  }
}
