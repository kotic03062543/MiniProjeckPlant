// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:myfirstapp/until/colors.dart';
// import 'package:myfirstapp/until/dimension.dart';
// import 'package:myfirstapp/widgets/big_text.dart';
// import 'package:myfirstapp/widgets/small_text.dart';

// import '../pages/home/main_plant_page.dart';

// // import 'Dashboard.dart';
// class Login extends StatefulWidget {
//   const Login({Key? key, required Map data}) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<Login> {
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();
//   Future login() async {
//     var url = Uri.parse("http://10.0.2.2/connectPHP/login.php");
//     var userdata = {};
//     userdata['username'] = user.text;
//     userdata['password'] = pass.text;

//     var response = await http.post(
//       url,
//       body: userdata,
//     );
//     var data = json.decode(response.body);
//     if (data.toString() == "Success") {
//       Fluttertoast.showToast(
//         msg: 'Login Successful',
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MainPlantPage(
//             data: {},
//           ),
//         ),
//       );
//     } else {
//       Fluttertoast.showToast(
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         msg: 'Username and password invalid',
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SmallText(text: 'WELCOME TO'),
//         BigText(text: 'PLANTY SHOP.',size: 35,),
//         SmallText(text: 'PLAEASE LOGIN TO CONTINUE',color: AppColors.mainblackcolor),
//         SizedBox(height: Dimensions.height20*1.5),
//         TextField(
//           controller: user,
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: 'Email / Username',
//             hintStyle: const TextStyle(
//               fontSize: 14,
//               color: Colors.white70,
//               // fontWeight: FontWeight.bold,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: const BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//             ),
//             filled: true,
//             fillColor: Colors.black,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         TextField(
//           obscureText: true,
//           style: const TextStyle(color: Colors.white),
//           controller: pass,
//           decoration: InputDecoration(
//             hintText: 'Password',
//             hintStyle: const TextStyle(
//               fontSize: 14,
//               color: Colors.white70,
//               // fontWeight: FontWeight.bold,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: const BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//             ),
//             filled: true,
//             fillColor: Colors.black,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//           ),
//         ),
//         const SizedBox(
//           height: 24,
//         ),
//         Container(
//           height: 40,
//           decoration: BoxDecoration(
//             color: const Color(0xFF1C1C1C),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(25),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFF1C1C1C).withOpacity(0.2),
//                 spreadRadius: 3,
//                 blurRadius: 4,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Center(
//               child: GestureDetector(
//             onTap: login,
//             child: const Text(
//               "LOGIN",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           )),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Center(
//           child: SmallText(text: 'FOGOT PASSWORD ?',color: AppColors.mainblackcolor,),
//         ),
//       ],
//     );
//   }
// }
