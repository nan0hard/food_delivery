// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../../controllers/popular_product_controller.dart';
import '../../../utils/dimensions.dart';

class DetailPageImage extends StatelessWidget {
  DetailPageImage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        height: Dimensions.popularFoodImgSize,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!),
          ),
        ),
      ),
    );
  }
}
