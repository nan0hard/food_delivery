// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/product_short_desc_and_review.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: Dimensions.pageViewTextContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.width30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFE8E8E8),
                    offset: Offset(0, 5),
                    blurRadius: 5),
                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5, 0)),
              ]),
          child: Container(
            padding: EdgeInsets.only(
                top: Dimensions.width15,
                left: Dimensions.width15,
                right: Dimensions.width15),
            child: ProductShortDescAndReview(text: "Burger and Fries"),
          )),
    );
  }
}
