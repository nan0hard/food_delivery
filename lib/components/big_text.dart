import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  TextOverflow overFlow;
  BigText(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF332D2B),
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400),
    );
  }
}
