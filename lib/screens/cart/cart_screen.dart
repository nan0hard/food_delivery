import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/big_text.dart';
import 'package:food_delivery/components/small_text.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/screens/home/food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.kmainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.kmainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.kmainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimensions.height20 * 4,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                  child: GetBuilder<CartController>(builder: (controller) {
                var _cartList = controller.getItems;
                return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: Dimensions.height20 * 5,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var popularIndex =
                                  Get.find<PopularProductController>()
                                      .popularProductList
                                      .indexOf(_cartList[index].product);
                              if (popularIndex >= 0) {
                                Get.toNamed(Routes.getPopularFood(
                                    popularIndex, 'cart'));
                              } else {
                                var recommendedIndex =
                                    Get.find<RecommendedProductController>()
                                        .recommendedProductList
                                        .indexOf(_cartList[index].product);
                                Get.toNamed(Routes.getRecommendedFood(
                                    recommendedIndex, 'cart'));
                              }
                            },
                            child: Container(
                              width: Dimensions.width20 * 5,
                              height: Dimensions.height20 * 5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        controller.getItems[index].img!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Expanded(
                              child: Container(
                            height: Dimensions.height20 * 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: controller.getItems[index].name!,
                                  color: Colors.black54,
                                ),
                                SmallText(text: "Spicy"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BigText(
                                      text: "\$ " +
                                          (controller.getItems[index].price! *
                                                  controller.getItems[index]
                                                      .quantity!)
                                              .toString(),
                                      color: Colors.redAccent,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.all(Dimensions.height10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.addItem(
                                                  _cartList[index].product!,
                                                  -1);
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
                                            text: _cartList[index]
                                                .quantity
                                                .toString(),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width10 / 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addItem(
                                                  _cartList[index].product!, 1);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: AppColors.ksignColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  },
                );
              })),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<CartController>(
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
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(
                          text: "\$ ${controller.totalAmount}",
                        ),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        //
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.kmainColor,
                      ),
                      child: Row(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart_checkout_outlined,
                            backgroundColor: AppColors.kmainColor,
                            iconColor: Colors.white,
                            size: Dimensions.iconSize24,
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          BigText(
                            text: "Checkout",
                            color: Colors.white,
                          ),
                        ],
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
