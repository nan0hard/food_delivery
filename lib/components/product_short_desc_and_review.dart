import 'package:flutter/material.dart';
import 'package:food_delivery/components/small_text.dart';

import '../screens/home/components/bottom_container_icon_and_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class ProductShortDescAndReview extends StatelessWidget {
  const ProductShortDescAndReview({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.kmainColor,
                  size: Dimensions.height20,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: "5.0"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "1287"),
            const SizedBox(
              width: 5,
            ),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height: Dimensions.height20),
        BottomContainerIconAndText(),
      ],
    );
  }
}
