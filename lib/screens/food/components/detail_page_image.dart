// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';

class DetailPageImage extends StatelessWidget {
  const DetailPageImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        height: Dimensions.popularFoodImgSize,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image/food0.png"),
          ),
        ),
      ),
    );
  }
}
