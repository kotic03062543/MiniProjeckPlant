// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:myfirstapp/widgets/small_text.dart';

import '../until/colors.dart';
import '../until/dimension.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            //แสดงสิ่งเหมือนกันง่าย
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return Icon(
                    Icons.star,
                    color: AppColors.maincolor,
                    size: 15,
                  );
                },
              ),
            ),
            SizedBox(width: 3),
            SmallText(text: '4.5'),
            SizedBox(width: 10),
            SmallText(text: '350'),
            SizedBox(width: 3),
            SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: 'Indoor',
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: UniconsLine.bitcoin,
              text: '250',
              iconColor: AppColors.iconColor2,
            ),
            IconAndTextWidget(
              icon: UniconsLine.telegram,
              text: '3',
              iconColor: AppColors.iconColor3,
            ),
          ],
        ),
      ],
    );
  }
}
