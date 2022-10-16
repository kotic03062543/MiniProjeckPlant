import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myfirstapp/until/colors.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
//  Future getmember() async {
//     var url1 = Uri.parse('http://10.0.2.2/photo/Select.php');
//     var response1 = await http.post(url1, body: {
//       'userid': widget.id,
//     });
//     var data1 = jsonDecode(response1.body);
//     print(data1);
//     for (var i = 0; i < data1.length; i++) {
//       mycourseModel mycourse = mycourseModel(
//         name: data1[i]['username'],
//         email: data1[i]['email'],
//         img: data1[i]['pic'],
//         fullname: data1[i]['fullname'],
//       );
//       this.memberlist.add(mycourse);
//     }
//     usernameController.text = memberlist[0].name.toString();
//     emailController.text = memberlist[0].email.toString();
//     fullnameController.text = memberlist[0].fullname.toString();
//     return memberlist;
//   }

//   Future Editmember(String username, String email, String fullname) async {
//     var url = Uri.parse('http://10.0.2.2/photo/EditUser.php');
//     var response = await http.post(url){
//       'userid': widget.id,
//       'username': username,
//       'email': email,
//       'fullname': fullname,
//     };
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemExtent: 95.0,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            margin: EdgeInsets.only(left: 15, right: 25),
                            //color: Colors.red,
                            child: ListTile(
                              visualDensity: VisualDensity(vertical: 4),
                              // leading: CircleAvatar(
                              //   backgroundImage: NetworkImage(
                              //     member[index]['picture'],scale: 100
                              //   ),
                              // ),

                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  // child: Image.asset(
                                  //   //when image null show default image
                                  //   memberlist[index].img == null
                                  //       ? 'img/img1.jpg'
                                  //       : 'img/${memberlist[index].img}',

                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Container(
                                  height: 38,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  child: Text('test'),
                                ),
                              ),
                              subtitle: Container(
                                color: null,
                                child: Text('test'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //EditUser
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: double.infinity,
                    height: 550,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Usernames'),
                          TextFormField(
                            // controller: usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 10, start: 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.maincolor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    onPressed: () {
                                      // _showToast();
                                      print('edit');
                                      // Editmember(
                                      //     usernameController.text,
                                      //     emailController.text,
                                      //     fullnameController.text);
                                    },
                                    icon: Icon(
                                      size: 20,
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
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
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Email',
                          ),
                          TextFormField(
                            // controller: emailController,
                            // controller: ,

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 10, start: 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.maincolor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    onPressed: () {
                                      // _showToast();
                                      // Editmember(
                                      //     usernameController.text,
                                      //     emailController.text,
                                      //     fullnameController.text);
                                    },
                                    icon: Icon(
                                      size: 20,
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Fullname',
                          ),
                          TextFormField(
                            // controller: fullnameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 10, start: 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.maincolor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                    onPressed: () {
                                      // _showToast();
                                      // print('edit');
                                      // Editmember(
                                      //     usernameController.text,
                                      //     emailController.text,
                                      //     fullnameController.text);
                                    },
                                    icon: Icon(
                                      size: 20,
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 300,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => {
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => login()),
                                  // )
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.maincolor,
                                  onPrimary: Color.fromARGB(255, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
