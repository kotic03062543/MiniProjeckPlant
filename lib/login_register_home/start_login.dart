// // ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myfirstapp/login_register_home/sign_up.dart';
// import 'package:myfirstapp/until/colors.dart';
// import 'package:myfirstapp/until/dimension.dart';
// import 'package:myfirstapp/widgets/big_text.dart';
// import 'package:myfirstapp/widgets/small_text.dart';
// import 'dart:convert';
// import 'login.dart';
// import 'login_option.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// // import 'package:myfirstapp/loginregister/signup.dart';

// // ignore: import_of_legacy_library_into_null_safe
// // import 'package:flutter_icons/flutter_icons.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         textTheme: GoogleFonts.muktaVaaniTextTheme(),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool login = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1C1C1C),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   login = true;
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.ease,
//                 height: login
//                     ? MediaQuery.of(context).size.height * 0.6
//                     : MediaQuery.of(context).size.height * 0.4,
//                 child: CustomPaint(
//                   painter: CurvePainter(login),
//                   child: Container(
//                     padding: EdgeInsets.only(bottom: login ? 0 : 55),
//                     child: Center(
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 32, vertical: 16),
//                           child: login
//                               ? const Login(
//                                   data: {},
//                                 )
//                               : const LoginOption(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   login = false;
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.ease,
//                 height: login
//                     ? MediaQuery.of(context).size.height * 0.4
//                     : MediaQuery.of(context).size.height * 0.6,
//                 child: Container(
//                     color: Colors.transparent,
//                     padding: EdgeInsets.only(top: login ? 55 : 0),
//                     child: Center(
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 32, vertical: 16),
//                           child: !login ? const SignUp() : const SignUpOption(),
//                         ),
//                       ),
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CurvePainter extends CustomPainter {
//   bool outterCurve;
//   bool register = true;
//   CurvePainter(this.outterCurve);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.shader = const RadialGradient(
//       colors: [
//         Colors.yellow,
//         Colors.green,
//       ],
//     ).createShader(Rect.fromCircle(
//       radius: 600,
//       center: const Offset(50, 50),
//     ));
//     paint.style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width * 0.5,
//         outterCurve ? size.height + 110 : size.height - 110,
//         size.width,
//         size.height);
//     path.lineTo(size.width, 0);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
// // signup.dart;

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();
//   TextEditingController fullname = TextEditingController();
//   TextEditingController user_email = TextEditingController();

//   Future register() async {
//     var url = Uri.parse("http://10.0.2.2/connectPHP/register.php");

//     var userdata = {};
//     userdata['username'] = user.text;
//     userdata['password'] = pass.text;
//     userdata['fullname'] = fullname.text;
//     userdata['user_email'] = user_email.text;

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
//           builder: (context) => HomePage(),
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
//         SmallText(
//           text: 'SIGN UP WITH',
//           color: AppColors.yellowcolor,
//         ),
//         BigText(text: 'PLANTY SHOP', color: AppColors.yellowcolor, size: 30),
//         SizedBox(
//           height: Dimensions.height20,
//         ),
//         TextField(
//           style: const TextStyle(color: Colors.white),
//           controller: user,
//           decoration: InputDecoration(
//             hintText: 'Username',
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
//         SizedBox(
//           height: Dimensions.height20,
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
//         SizedBox(
//           height: Dimensions.height20,
//         ),
//         TextField(
//           style: const TextStyle(color: Colors.white),
//           controller: fullname,
//           decoration: InputDecoration(
//             hintText: 'fullname',
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
//         SizedBox(
//           height: Dimensions.height20,
//         ),
//         TextField(
//           style: const TextStyle(color: Colors.white),
//           controller: user_email,
//           decoration: InputDecoration(
//             hintText: 'Email',
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
//         const Text(
//           "Or Signup with",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             color: Color(0xFFF3D657),
//             height: 1,
//           ),
//         ),
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
//             // SizedBox(
//             //   width: 24,
//             // ),
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
