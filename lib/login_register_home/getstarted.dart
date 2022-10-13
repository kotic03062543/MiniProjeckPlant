// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'login_regis.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login / Reginster'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  height: 60,
                  child: OutlinedButton.icon(
                    style: ButtonStyle(
                      // shadowColor: MaterialStateProperty,
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromRGBO(221, 238, 223, 3)),
                      side: MaterialStateProperty.all(
                        BorderSide(color: Colors.green, width: 4),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginRegis();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.login,
                      color: Colors.green,
                    ),
                    label: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
