// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../../components/app_icon.dart';
import '../../components/big_text.dart';
import '../../components/expandable_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'components/clear_and_cart_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height30 * 2 + Dimensions.height10,
              title: ClearAndCartIcon(),
              pinned: true,
              backgroundColor: AppColors.kyellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                  )),
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: Dimensions.height10 / 2,
                    bottom: Dimensions.height10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableText(text: product.description!),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20 * 2.5,
                    vertical: Dimensions.height10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          icon: Icons.remove,
                          backgroundColor: AppColors.kmainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                        ),
                      ),
                      BigText(
                        text:
                            "\$ ${product.price!}  X  ${controller.inCartItems}",
                        color: AppColors.kmainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                          icon: Icons.add,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.kmainColor,
                          iconSize: Dimensions.iconSize24,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.kmainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.height20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.kmainColor,
                          ),
                          child: BigText(
                            text: "\$${product.price!} | Add to Cart",
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
