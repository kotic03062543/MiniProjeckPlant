// ignore_for_file: unnecessary_new, library_private_types_in_public_api, prefer_const_constructors, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:myfirstapp/profile/edit_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class EditUserProfile extends StatefulWidget {
  final String user_id;

  EditUserProfile({Key? key, required this.user_id}) : super(key: key);

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  TextEditingController email = new TextEditingController();
  TextEditingController telephone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController newpassword = new TextEditingController();

  bool editMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmember();
    print(widget.user_id);
  }

  Future getmember() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
    var response1 = await http.post(url, body: {
      'user_id': widget.user_id,
    });
    var data = jsonDecode(response1.body);
    // String user_id = data[0]['user_id'].toString();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: FutureBuilder(
        future: getmember(),
        builder: (context, snapshot) {
          List list = snapshot.data;
          print(snapshot);
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return TextField(
                      controller: email,
                      decoration: new InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    );
                    // ignore: dead_code
                    TextField(
                      controller: telephone,
                      // enabled: false,
                      decoration: new InputDecoration(
                        hintText: "Telephone",
                        labelText: "Telephone",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    );
                    TextField(
                      controller: address,
                      // obscureText: true,
                      decoration: new InputDecoration(
                        hintText: "Address",
                        labelText: "Address",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    );
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    );
                    TextField(
                      controller: newpassword,
                      obscureText: true,
                      decoration: new InputDecoration(
                        hintText: "New Password",
                        labelText: "New Password",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}


//               TextField(
//                 controller: email,
//                 decoration: new InputDecoration(
//                   hintText: "Email",
//                   labelText: "Email",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   labelStyle: Theme.of(context).textTheme.bodyText2,
//                 ),
//               ),
//               TextField(
//                 controller: telephone,
//                 // enabled: false,
//                 decoration: new InputDecoration(
//                   hintText: "Telephone",
//                   labelText: "Telephone",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   labelStyle: Theme.of(context).textTheme.bodyText2,
//                 ),
//               ),
//               TextField(
//                 controller: address,
//                 // obscureText: true,
//                 decoration: new InputDecoration(
//                   hintText: "Address",
//                   labelText: "Address",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   labelStyle: Theme.of(context).textTheme.bodyText2,
//                 ),
//               ),
//               TextField(
//                 controller: password,
//                 obscureText: true,
//                 decoration: new InputDecoration(
//                   hintText: "Password",
//                   labelText: "Password",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   labelStyle: Theme.of(context).textTheme.bodyText2,
//                 ),
//               ),
//               TextField(
//                 controller: newpassword,
//                 obscureText: true,
//                 decoration: new InputDecoration(
//                   hintText: "New Password",
//                   labelText: "New Password",
//                   hintStyle: Theme.of(context).textTheme.bodyText2,
//                   labelStyle: Theme.of(context).textTheme.bodyText2,
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 child: new Text("Continue"),
//                 onPressed: () {
//                   setState(() {
//                     editUser();
//                   });
//                 },
//               )
