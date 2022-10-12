// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                    text: hiddenText
                        ? (firstHalf + ' ...')
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText=!hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'Show more',
                        color: AppColors.maincolor,
                      ),
                      Icon(
                        hiddenText
                            ? UniconsLine.angle_down
                            : UniconsLine.angle_up,
                        color: AppColors.maincolor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
