// ignore_for_file: prefer_const_constructors, equal_keys_in_map, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';
import '../../model/productsearch.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class search extends StatefulWidget {
  final String user_id;
  const search({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<search> createState() => _searchState();
}



class _searchState extends State<search> {

  //Variable
  List<Productserach> productserach = [];


  Future getdata() async {
    // var url = "http://localhost/addressbook/select.php";
    var url = Uri.parse(
        "https://plantyshop.vitinias.com/connectPHP/selectproduct.php");
    var response = await http.get(url);
    var data = json.decode(response.body);
    for (var i=0; i<data.length; i++) {
      Productserach productserach = Productserach(
        data[i]['product_id'],
        data[i]['product_name'],
        data[i]['product_detail'],
        data[i]['product_price'],
        data[i]['type_id'],
        data[i]['product_pic'],
        data[i]['product_amount'],
        data[i]['pot_id'],
        data[i]['product_star'],
        data[i]['product_water'],
        data[i]['product_light'],
        data[i]['product_fer'],
      );
      this.productserach.add(productserach);
    }
    // print(data.toString());
    // print('getdata'+ data);
    // return data;
    return productserach;
    
   

  }

  Future searchdata(String search) async {
    // var url = "http://localhost/addressbook/select.php";
    var url =
        Uri.parse("https://plantyshop.vitinias.com/connectPHP/searchcus.php");
    var response = await http.post(url,body: {
      "product_name": search,
    });
    var data = jsonDecode(response.body);
    for (var i=0; i<data.length; i++) {
      Productserach productserach = Productserach(
        data[i]['product_id'],
        data[i]['product_name'],
        data[i]['product_detail'],
        data[i]['product_price'],
        data[i]['type_id'],
        data[i]['product_pic'],
        data[i]['product_amount'],
        data[i]['pot_id'],
        data[i]['product_star'],
        data[i]['product_water'],
        data[i]['product_light'],
        data[i]['product_fer'],

      );
      this.productserach.add(productserach);
    }
    print('searchdata'+ data);
    return productserach;
  }

  // Future<void> search() async {
  //   final fetchsearchdata = await searchdata(textController.text);
  //   setState(() {
  //     productserach.clear();
  //     productserach = fetchsearchdata;
  //   });
  // }

  void searchproduct(String search) {
    final searchproduct = productserach.where((Productserach) {
      final productname = Productserach.productname!.toLowerCase();
      final searchlower = search.toLowerCase();
      return productname.contains(searchlower);
    
    }).toList();
    setState(() {
      productserach.clear();
      productserach = searchproduct;
    
    });
  
  }
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width10,
            right: Dimensions.width10,
            top: Dimensions.height20 * 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 340,
                    height: 50,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextFormField(
                      controller: textController,
                      onChanged: (value) {
                        searchproduct(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: IconButton(
                          onPressed: () {
                           
                          },
                          icon: Icon(UniconsLine.search),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10,),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 10,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              // color: Colors.amber,
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                    () {
                      setState(() {});
                    },
                  );
                },
                // child: FutureBuilder(
                //   future: searchdata(textController.text),
                //   builder: (context, AsyncSnapshot snapshot) {
                //     if (snapshot.hasError) print(snapshot.error);
                //     return snapshot.hasData
                //         ? ListView.builder(
                //             // shrinkWrap: true,
                //             itemCount: snapshot.data.length,
                //             itemBuilder: (context, index) {
                //               List list = snapshot.data;
                //               return SizedBox(
                //                 width: double.maxFinite,
                //                 height: Dimensions.height20 * 10,
                //                 child: GestureDetector(
                //                   onTap: () {},
                //                   child: Row(
                //                     children: [
                //                       Container(
                //                         width: Dimensions.width20 * 7,
                //                         height: Dimensions.height20 * 12,
                //                         margin: EdgeInsets.only(bottom: 10),
                //                         decoration: BoxDecoration(
                //                           image: DecorationImage(
                //                             fit: BoxFit.cover,
                //                             image: AssetImage('images/' +
                //                                 list[index]['product_pic']),
                //                           ),
                //                           color: Colors.white,
                //                           borderRadius:
                //                               BorderRadius.circular(20),
                //                         ),
                //                       ),
                //                       SizedBox(width: Dimensions.width20),
                //                       Expanded(
                //                         child: Container(
                //                           height: Dimensions.height20 * 10,
                //                           child: Column(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceEvenly,
                //                             children: [
                //                               BigText(
                //                                   text: list[index]
                //                                       ['product_name'],
                //                                   color: Colors.black54),
                //                               SmallText(text: 'Plant Shop'),
                //                               Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment
                //                                         .spaceBetween,
                //                                 children: [
                //                                   BigText(
                //                                       text: '฿ ' +
                //                                           list[index]
                //                                               ['product_price'],
                //                                       color:
                //                                           AppColors.lightRed),
                //                                   Container(
                //                                     padding: EdgeInsets.only(
                //                                         top: 15,
                //                                         bottom: 15,
                //                                         right: 20,
                //                                         left: 20),
                //                                     decoration: BoxDecoration(
                //                                         borderRadius:
                //                                             BorderRadius
                //                                                 .circular(20),
                //                                         color: Colors.white),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               );
                //             },
                //           )
                //         : Center(child: CircularProgressIndicator());
                //   },
                // ),
                child: FutureBuilder(
                  future: getdata(),
                   builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.data == null){
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }else{
                      return Container(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){
                            return ProductCard(
                              productserach: snapshot.data[index],
                            
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {

  Productserach productserach;

  ProductCard({super.key,required this.productserach});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Dimensions.height20 * 10,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: Dimensions.width20 * 7,
              height: Dimensions.height20 * 12,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/' + '${widget.productserach.productimage}'),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: Dimensions.width20),
            Expanded(
              child: Container(
                height: Dimensions.height20 * 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(text: '${widget.productserach.productname}', color: Colors.black54),
                    SmallText(text: 'Plant Shop'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: '฿ ' + '${widget.productserach.productprice}', color: AppColors.lightRed),
                        Container(
                          padding: EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
