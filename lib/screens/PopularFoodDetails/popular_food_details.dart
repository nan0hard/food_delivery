// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
// import 'package:food_delivery/screens/PopularFoodDetails/components/body.dart';
import 'package:get/get.dart';

import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../components/expandable_text.dart';
import '../../components/product_short_desc_and_review.dart';
import '../../controllers/popular_product_controller.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
// import 'components/back_and_cart_icon.dart';
import 'components/detail_page_image.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetails({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            DetailPageImage(
              pageId: pageId,
            ),
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == 'cart') {
                        Get.toNamed(Routes.getCart());
                      } else {
                        Get.toNamed(Routes.getInitial());
                      }
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconSize: Dimensions.iconSize16,
                    ),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller.totalItems >= 1) {
                                Get.toNamed(Routes.getCart());
                              }
                            },
                            child: AppIcon(
                              icon: Icons.shopping_cart_outlined,
                              iconSize: Dimensions.iconSize16,
                            ),
                          ),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.kmainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 6.5,
                                  top: 3.5,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
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
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Description"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //SingleChildScrollView does not work alone in column so wrap
                    //in a Expanded Widget

                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(text: product.description!),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColors.kbuttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.ksignColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(
                          text: "${controller.inCartItems}",
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.ksignColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.kmainColor,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: BigText(
                        text: "\$ ${product.price!} | Add to Cart",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
