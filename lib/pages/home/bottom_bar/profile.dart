// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/controller/payment_controller.dart';
import 'package:myfirstapp/pages/plant_shop/payment.dart';
import 'package:myfirstapp/until/colors.dart';

import '../../../login_register_home/getstarted.dart';
import '../../../profile/edituser_profile.dart';
import '../../../widgets/big_text.dart';

class ProFile extends StatefulWidget {
  final String user_id;
  ProFile({Key? key, required this.user_id}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  Future getmember() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
    var response1 = await http.post(url, body: {
      'user_id': widget.user_id,
    });
    var data = jsonDecode(response1.body);
    // print(data);
    return data;
    // String user_id = data[0]['user_id'].toString();
  }

  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 55),
            child: Text(
              "Your Profile",
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            Duration(seconds: 2);
            setState(() {});
          },
          child: FutureBuilder(
            future: getmember(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return Stack(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 25, right: 25),
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: Image.network(
                                      'https://plantyshop.vitinias.com/connectPHP/img/${list[index]['user_pic']}',
                                    ).image,
                                    fit: BoxFit.cover,
                                    // borderRadius: BorderRadius.circular(25),
                                    // color: Colors.red[100],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 160, left: 35),
                              child: Container(
                                width: 320,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.greencolorlow,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        list[index]['fullname'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.maincolor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditUserProfile(
                                              user_id: widget.user_id,
                                              list: list,
                                              index: index,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Edit Profile',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.maincolor,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25, top: 270, right: 25),
                              child: Container(
                                width: double.infinity,
                                height: 45,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Payments()));
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.solidCreditCard,
                                    size: 22,
                                    color: AppColors.maincolor,
                                  ),
                                  label: Text(
                                    'Payments',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.grey[850],
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Colors.grey[850]!,
                                      width: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: AppColors.greycolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.only(
                        top: 12, bottom: 5, right: 20, left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.maincolor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: 'LOGOUT',
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
