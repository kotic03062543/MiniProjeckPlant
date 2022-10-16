// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Track Order",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.lime[900]),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.cartShopping, color: Colors.grey[850]),
            tooltip: 'Shop',
            onPressed: () {},
          ), //IconButton
        ],
        elevation: 0,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.barsStaggered, color: Colors.grey[850]),
          tooltip: 'Bar',
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30, left: 25, right: 25),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red[100],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 70, top: 70),
              child: Text(
                "Account name",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.lime[900]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 122, top: 80),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, top: 170),
              child: IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                ),
                iconSize: 30,
                color: Colors.black,
                alignment: Alignment.bottomLeft,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 270, right: 25),
              child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey.shade800),
                      borderRadius: BorderRadius.all(Radius.circular(13) 
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 275),
                      child: Icon(FontAwesomeIcons.solidCreditCard, color: Colors.grey.shade800,), 
                      
                    ),
                  ),
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
