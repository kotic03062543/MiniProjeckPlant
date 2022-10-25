// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstapp/pages/home/bottom_bar/home.dart';
import 'package:myfirstapp/pages/home/bottom_bar/profile.dart';

class Payments extends StatefulWidget {
  Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Launcher(user_id: widget.user_id,)));
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
              "Payments",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, right: 20),
              child: Container(
                child: Text(
                  "Select the top up method you want to use.",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[850]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  // Container(
                  //   child: ListTile(
                  //     leading: Icon(
                  //       FontAwesomeIcons.paypal,
                  //       color: Colors.indigo,
                  //     ),
                  //     title: Text(
                  //       "Paypal",
                  //       style: GoogleFonts.poppins(
                  //           fontSize: 18, fontWeight: FontWeight.w600),
                  //     ),
                  //     trailing: Icon(
                  //       Icons.arrow_forward_ios_rounded,
                  //       color: Colors.grey[850],
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.grey[850]!,
                  //       width: 2,
                  //     ),
                  //     borderRadius: BorderRadius.all(Radius.circular(15) //
                  //         ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x35000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 10, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/paypal.png',
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                            child: Text(
                              'Paypal',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   Container(
                    // margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x35000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 10, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/scb.png',
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                            child: Text(
                              'SCB',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                   Container(
                    // margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x35000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 10, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/k-bank.png',
                                    width: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                            child: Text(
                              'K Bank',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                   Container(
                    // margin: EdgeInsets.only(left: 30, top: 30, right: 30),
                    width: 350,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x35000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 10, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/aomsin.png',
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                            child: Text(
                              'GSB',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
