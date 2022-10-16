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

// void goHome(String userid) {
//     Navigator.pushReplacement(
//       context,
//       PageTransition(
//         type: PageTransitionType.rightToLeft,
//         child: home(
//           id: userid,
//         ),
//       ),
//     );
//   }


  // Future getmember() async {
  //   var url = Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
  //   var response1 = await http.post(url, body: {
  //     'user_id': widget.id,
  //   });
  //   var data = jsonDecode(response1.body);
  //   print(data);
  //   String user_id = data[0]['user_id'].toString();

    // var data = jsonDecode(response1.body);
    // // print(data);
    // for (var i = 0; i < data.length; i++) {
    //   ModelUserMember user = ModelUserMember(
    //     username: data[i]['username'],
    //   );
    //   this.memberlist.add(user);
    // }
    // print('Member: $memberlist');
    // return memberlist;
  // }