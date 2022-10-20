// // ignore_for_file: unnecessary_new, library_private_types_in_public_api, prefer_const_constructors, unused_import

// import 'package:flutter/material.dart';
// import 'package:myfirstapp/profile/edit_profile.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// class EditUserProfile extends StatefulWidget {
//   final String email;

//   const EditUserProfile({Key? key, required this.email}) : super(key: key);

//   @override
//   _EditUserProfileState createState() => _EditUserProfileState();
// }

// class _EditUserProfileState extends State<EditUserProfile> {
//   TextEditingController email = new TextEditingController();
//   TextEditingController telephone = new TextEditingController();
//   TextEditingController address = new TextEditingController();
//   TextEditingController password = new TextEditingController();
//   TextEditingController newpassword = new TextEditingController();

//   bool editMode = false;

//   Future getdata() async {
//     // var url = "https://pattyteacher.000webhostapp.com/select.php";
//     var url = Uri.parse("http://localhost/addressbook/select_user.php");
//     var data = {'email': email.text};
//     var response = await http.post(url, body: json.encode(data));
//     // var response = await http.get(url);

//     return json.decode(response.body);
//   }

 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Edit Profile')),
//         body: FutureBuilder(
//           future: getdata(),
//           builder: (context, snapshot) {
//             List list = snapshot.data;
//             print(snapshot);
//             if (snapshot.hasError) print(snapshot.error);
//             return snapshot.hasData
//                 ? EditUserProfile(
//                     email: list,
//                     index: 0,
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(),
//                   );
//           },
//         ));
//   }
// }