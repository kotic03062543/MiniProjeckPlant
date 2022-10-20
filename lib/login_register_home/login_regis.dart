// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, non_constant_identifier_names, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:miniproject/home.dart';
// import 'package:miniproject/main.dart';
import 'package:myfirstapp/login_register_home/getstarted.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../pages/home/bottom_bar/home.dart';
import '../pages/home/main_plant_page.dart';

class LoginRegis extends StatefulWidget {
  const LoginRegis({Key? key}) : super(key: key);

  @override
  State<LoginRegis> createState() => _loginState();
}

class _loginState extends State<LoginRegis> {
  FToast fToast = FToast();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  final formusersname = TextEditingController();
  final formpassword = TextEditingController();

  void checkLogin(String username, String password) async {
    var url = Uri.parse('https://plantyshop.vitinias.com/connectPHP/login.php');
    var response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    var data = jsonDecode(response.body);
    if (data == "Fail") {
      _showToast();
      print("Login Error");
      return;
    } else {
      String user_id = data[0]['user_id'].toString();
      _showToastSuccess();
      Homepage(user_id);
    }
  }

  void Homepage(String user_id) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: Launcher(
          id: user_id,
        ),
      ),
    );
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color.fromARGB(255, 230, 81, 55),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(Icons.error_outline),
          SizedBox(
            width: 12.0,
          ),
          Text("Username and password invalid"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _showToastSuccess() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.maincolor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          SizedBox(
            width: 12.0,
          ),
          Text("Login Success",style: TextStyle(color: AppColors.whiteColor)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  TextStyle heading1 = GoogleFonts.kanit(
      fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle Chike = GoogleFonts.kanit(
      decoration: TextDecoration.underline,
      decorationThickness: 2,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  TextStyle Input = GoogleFonts.kanit(color: Colors.white);
  TextStyle password = GoogleFonts.kanit(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.maincolor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 340,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset('./images/logo1.png'),
                  Text(
                    'WELCOME TO',
                    style: heading1,
                  ),
                  SizedBox(height: Dimensions.height10),
                  BigText(text: 'LOGIN', color: AppColors.whiteColor),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: formusersname,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: Input,
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      controller: formpassword,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: Input,
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget Password?',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          {checkLogin(formusersname.text, formpassword.text)},
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have account yet ?',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return register();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////
///register

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final formkey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController user_email = TextEditingController();

  Future addUser() async {
    // var url = "https://pattyteacher.000webhostapp.com/insert_user.php";
    var url =
        Uri.parse("https://plantyshop.vitinias.com/connectPHP/register.php");
    var data = {};
    data['username'] = username.text;
    data['password'] = password.text;
    data['fullname'] = fullname.text;
    data['user_email'] = user_email.text;

    // print(username.text);
    // print(password.text);
    // print(fullname.text);
    // print(user_email.text);

    var response = await http.post(
      url,
      body: data,
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "Username Or Email already exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16.0);
      } else if (data == "Success") {
        Fluttertoast.showToast(
            msg: "Register Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: AppColors.maincolor,
            textColor: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginRegis(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Insert Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  TextStyle heading1 = GoogleFonts.kanit(
      fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
  TextStyle Chike = GoogleFonts.kanit(
      decoration: TextDecoration.underline,
      decorationThickness: 2,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  TextStyle Input = GoogleFonts.kanit(color: Colors.white);
  // TextStyle password = GoogleFonts.kanit(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.maincolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: heading1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 350,
                          //username
                          child: TextFormField(
                            controller: username,
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'กรุณากรอกอีเมล'),
                            //   EmailValidator(errorText: 'รูปแบบอีเมลไม่ถูกต้อง'),
                            // ]),
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: Input,
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: SizedBox(
                          width: 350,
                          //password
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'enter a valid email address'),
                            //   EmailValidator(errorText: 'this field is required'),
                            // ]),
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Input,
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: SizedBox(
                          width: 350,
                          // fullname
                          child: TextFormField(
                            controller: fullname,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Fullname',
                              labelStyle: Input,
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: SizedBox(
                          width: 350,
                          // email
                          child: TextFormField(
                            controller: user_email,
                            // obscureText: true,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'enter a valid email address'),
                              EmailValidator(
                                  errorText: 'this field is required'),
                            ]),
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: Input,
                              contentPadding: EdgeInsets.all(20),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //ปุ่ม register
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 120, vertical: 10),
                          child: Text(
                            "Register",
                            style: GoogleFonts.poppins(
                              color: AppColors.maincolor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        onPressed: () {
                          addUser();
                        },
                      ),
                      SizedBox(height: 25),
                      Center(
                        //ยังไม่มีบัญชี
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account ?',
                              style:
                                  GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, MaterialPageRoute(
                                    builder: (context) {
                                      return LoginRegis();
                                    },
                                  ));
                                },
                                child: Text(
                                  'Back to login.',
                                  style: GoogleFonts.poppins(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
