// ignore_for_file: prefer_const_constructors

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
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 25, right: 25),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.red[100],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 5, bottom: 5),
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
          ),
        ),
      ),
    );
  }
}
