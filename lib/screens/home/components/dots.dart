import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required double currPageValue,
  })  : _currPageValue = currPageValue,
        super(key: key);

  final double _currPageValue;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (controller) {
      return DotsIndicator(
        dotsCount: controller.popularProductList.isEmpty
            ? 1
            : controller.popularProductList.length,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.kmainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      );
    });
  }
}
