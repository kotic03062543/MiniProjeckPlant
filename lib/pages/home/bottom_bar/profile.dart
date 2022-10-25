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

import '../../../profile/edituser_profile.dart';

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
    );
  }
}

// 323232
//                             LoadingAnimationWidget.waveDots(
//                               color: ColorCustom.orangecolor(),
//                               size: 50,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Center(
//                               child: Text(
//                                 'กำลังโหลดข้อมูล...',
//                                 style: TextCustom.normal_mdg20(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return snapshot.data.length != 0
//                           ? Expanded(
//                               child: RefreshIndicator(
//                                   onRefresh: refresh,
//                                   child: ListView.builder(
//                                     itemCount: snapshot.data.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       List list = snapshot.data;
//                                       return Container(
//                                         margin:
//                                             EdgeInsets.symmetric(vertical: 10),
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       EditPeriod(
//                                                         list: list,
//                                                         index: index,
//                                                       )),
//                                             );
//                                           },
//                                           child: Row(
//                                             children: [
//                                               Expanded(
//                                                 flex: 3,
//                                                 child: Column(
//                                                   children: [
//                                                     ListTile(
//                                                       title: Text(
//                                                         snapshot.data[index]
//                                                             ['greenhouse_name'],
//                                                         style: TextCustom
//                                                             .bold_b16(),
//                                                       ),
//                                                       subtitle: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             'วันที่ปลูก  ' +
//                                                                 snapshot.data[
//                                                                         index][
//                                                                     'create_date'],
//                                                             style: TextCustom
//                                                                 .normal_dg14(),
//                                                           ),
//                                                           Text(
//                                                             'วันที่คาดว่าจะเก็บเกี่ยว ' +
//                                                                 snapshot.data[
//                                                                         index][
//                                                                     'harvest_date'],
//                                                             style: TextCustom
//                                                                 .normal_dg14(),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: IconButton(
//                                                   icon: Icon(
//                                                     Icons.settings,
//                                                     size: 30,
//                                                     color: ColorCustom
//                                                         .orangecolor(),
//                                                   ),
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               EditPeriodSetting(
//                                                                 list: list,
//                                                                 index: index,
//                                                               )),
//                                                     );
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                             primary:
//                                                 ColorCustom.lightyellowcolor(),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                             padding: EdgeInsets.all(10),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   )),
//                             )
//                           : Column(
//                               children: [
//                                 Lottie.asset(
//                                   'assets/animate/empty.json',
//                                   width: 250,
//                                   height: 250,
//                                 ),
//                                 Text(
//                                   'ไม่มีรอบการปลูก',
//                                   style: TextCustom.normal_mdg20(),
//                                 ),
//                               ],
//                             );