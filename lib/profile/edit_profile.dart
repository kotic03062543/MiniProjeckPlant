// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, prefer_typing_uninitialized_variables, unused_field, unused_element, unused_local_variable, avoid_print, must_be_immutable, unnecessary_new, sized_box_for_whitespace, use_build_context_synchronously, library_private_types_in_public_api, unused_import

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:myfirstapp/profile/track_order.dart';
// import 'package:http/http.dart' as http;

// class EditProfile extends StatefulWidget {
//   File? pickedFile;
//   ImagePicker imagePicker = ImagePicker();

//   final List list;
//   final int index;

//   EditProfile({Key? key, required this.list, required this.index})
//       : super(key: key);

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// // import 'package:fluttermysql/pages/adduser.dart';
// // import 'package:fluttermysql/pages/edituser.dart';
// // import 'package:fluttermysql/pages/login.dart';
// // import 'package:fluttermysql/pages/profile.dart';
// import 'package:http/http.dart' as http;

// class EditProFile extends StatefulWidget {
//   static const routeName = '/';
//   final String id;

//   const EditProFile({super.key, required this.id});
//   @override
//   _State createState() => _State();
// }


// class _EditProfileState extends State<EditProfile> {
//   TextEditingController email = TextEditingController();
//   TextEditingController telephone = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController newpassword = TextEditingController();

//   bool editMode = false;

//   Future editUser() async {
//     if (editMode) {
//       // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
//       var url = Uri.parse("http://localhost/addressbook/edit.php");
//       await http.post(url, body: {
//         //'id' : widget.list[widget.index]['id'],
//         'email': email.text,
//         'telephone': telephone.text,
//         'address': address.text,
//         'password': password.text,
//         'newpassword': newpassword.text,
//       });
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => TrackOrder(),
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     if (widget.index != null) {
//       editMode = true;
//       email.text = widget.list[widget.index]['email'];
//       telephone.text = widget.list[widget.index]['telephone'];
//       address.text = widget.list[widget.index]['address'];
//       password.text = widget.list[widget.index]['password'];
//       newpassword.text = widget.list[widget.index]['new password'];
//     }

// class _State extends State<EditProFile> {
//   @override
//   void initState() {
//     super.initState();
//     getmember();
//   }


//   Future getmember() async {
//     var url =
//         Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
//     var response1 = await http.post(url, body: {
//       'user_id': widget.id,
//     });
//     var data = jsonDecode(response1.body);
//     // print(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => TrackOrder()));
//           },
//           icon: Icon(
//             FontAwesomeIcons.circleChevronLeft,
//             color: Colors.grey[850],
//           ),
//         ),
//         title: Center(
//           child: Padding(
//             padding: EdgeInsets.only(right: 45),
//             child: Text(
//               "Your Profile",
//               style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                   color: Colors.lime[900]),
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//       ),
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage("images/plantlogo.png"),
//                 radius: 80,
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: InkWell(
//                   child: Icon(FontAwesomeIcons.cameraRotate),
//                   onTap: () {
//                     print("Camera clicked");
//                     showModalBottomSheet(
//                         context: context,
//                         builder: (context) => bottomSheet(context));
//                   },
//                 ),
//               ),
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
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget bottomSheet(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: double.infinity,
//       height: size.height * 0.2,
//       margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: Column(
//         children: [
//           Text(
//             "Choose Profile Photo",
//             style: GoogleFonts.poppins(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(FontAwesomeIcons.image, color: Colors.lime[600]),
//                     SizedBox(height: 5),
//                     Text(
//                       "Gallery",
//                       style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.lime[600]),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   //takePhoto(ImageSource.gallery);
//                 },
//               ),
//               SizedBox(width: 80),
//               InkWell(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(FontAwesomeIcons.camera, color: Colors.lime[900]),
//                     SizedBox(height: 5),
//                     Text(
//                       "Camera",
//                       style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.lime[900]),
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   //takePhoto(ImageSource.camera);
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// //   Future<void> takePhoto(ImageSource source) async {
// //     final pickedImage =
// //         await ImagePicker.pickImage(source: source, imageQuality: 100);

// //     pickedFile = File(pickedImage!.path);

// //     print(pickedFile);
// //   }
// // }

//       body: Text('EditProFile'),
//     );
//   }
// }

