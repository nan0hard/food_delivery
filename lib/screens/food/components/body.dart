// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/components/expandable_text.dart';
import 'package:food_delivery/utils/dimensions.dart';
import '../../../components/big_text.dart';
import '../../../components/product_short_desc_and_review.dart';
import 'back_and_cart_icon.dart';
import 'detail_page_image.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailPageImage(),
        BackAndCartIcon(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: Dimensions.popularFoodImgSize - Dimensions.height20,
          child: Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.width20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductShortDescAndReview(
                  text: "Mac and Cheese",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                BigText(text: "Introduce"),
                SizedBox(
                  height: Dimensions.height20,
                ),
                //SingleChildScrollView does not work alone in column so wrap
                //in a Expanded Widget

                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableText(
                        text:
                            "Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy. Nitish is a good Boy."),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
