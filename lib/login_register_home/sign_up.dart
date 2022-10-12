// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:myfirstapp/widgets/small_text.dart';

// import '../pages/home/main_plant_page.dart';

// // import 'Dashboard.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();

//   //check register
//   Future register() async {
//     var url = Uri.parse("http://10.0.2.2/connectPHP/register.php");
//     var userdata = {};
//     userdata['username'] = user.text;
//     userdata['password'] = pass.text;

//     var response = await http.post(
//       url,
//       body: userdata,
//     );
//     var data = json.decode(response.body);
//     if (data == "Error") {
//       Fluttertoast.showToast(
//         backgroundColor: Colors.orange,
//         textColor: Colors.white,
//         msg: 'User already exit!',
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     } else {
//       Fluttertoast.showToast(
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         msg: 'Registration Successful',
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
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SmallText(text: ''),

//         const SizedBox(
//           height: 16,
//         ),

//         TextField(
//           style: const TextStyle(color: Colors.white),
//           controller: user,
//           decoration: InputDecoration(
//             hintText: 'Enter Email / Username',
//             hintStyle: const TextStyle(
//               fontSize: 16,
//               color: Colors.white70,
//               fontWeight: FontWeight.bold,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: const BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//             ),
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.1),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//           ),
//         ),

//         const SizedBox(
//           height: 16,
//         ),

//         TextField(
//           style: const TextStyle(color: Colors.white),
//           obscureText: true,
//           controller: pass,
//           decoration: InputDecoration(
//             hintText: 'Password',
//             hintStyle: const TextStyle(
//               fontSize: 16,
//               color: Colors.white70,
//               fontWeight: FontWeight.bold,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: const BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//             ),
//             filled: true,
//             fillColor: Colors.grey.withOpacity(0.1),
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
//             color: const Color(0xFFF3D657),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(25),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFFF3D657).withOpacity(0.2),
//                 spreadRadius: 3,
//                 blurRadius: 4,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Center(
//               child: GestureDetector(
//             onTap: register,
//             child: const Text(
//               "SIGN UP",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1C1C1C),
//               ),
//             ),
//           )),
//         ),
//         const SizedBox(
//           height: 24,
//         ),
//         // const Text(
//         //   "Or Sign up with",
//         //   textAlign: TextAlign.center,
//         //   style: TextStyle(
//         //     fontSize: 16,
//         //     color: Color(0xFFF3D657),
//         //     height: 1,
//         //   ),
//         // ),
//         const SizedBox(
//           height: 16,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             // Icon(
//             //   Entypo.facebook_with_circle,
//             //   size: 32,
//             //   color: Color(0xFFF3D657),
//             // ),
//             SizedBox(
//               width: 24,
//             ),
//             // Icon(
//             //   Entypo.google__with_circle,
//             //   size: 32,
//             //   color: Color(0xFFF3D657),
//             // ),
//           ],
//         )
//       ],
//     );
//   }
// }
// // signup_option.dart

// class SignUpOption extends StatelessWidget {
//   const SignUpOption({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Text(
//           "OR",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             height: 1,
//             color: Color(0xFFF3D657),
//           ),
//         ),
//         const SizedBox(
//           height: 24,
//         ),
//         Container(
//           height: 40,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF3D657),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(25),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFFF3D657).withOpacity(0.2),
//                 spreadRadius: 3,
//                 blurRadius: 4,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: const Center(
//             child: Text(
//               "SIGN UP",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1C1C1C),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
