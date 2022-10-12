// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class MediamText extends StatelessWidget {
  Color? color;
  final String text;
  // TextOverflow overflow;
  double size;
  double height;

  MediamText({
    Key? key,
    this.color = const Color(0xFFA6A9B6),
    required this.text,
    // this.overflow = TextOverflow.ellipsis,
    this.size = 18,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      // overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        letterSpacing: 1.1,
        fontFamily: 'Roboto',
      ),
      textAlign: TextAlign.justify,
    );
  }
}
