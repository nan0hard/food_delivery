import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

import '../../../components/big_text.dart';
import '../../../components/small_text.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/dimensions.dart';
import 'bottom_container_icon_and_text.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedProductController>(
      builder: (recommendedProduct) {
        return recommendedProduct.isLoaded
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getRecommendedFood(index, 'home'));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(children: [
                        //Image Section
                        Container(
                          height: Dimensions.listViewImgSize,
                          width: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstants.BASE_URL +
                                  AppConstants.UPLOAD_URL +
                                  recommendedProduct
                                      .recommendedProductList[index].img!),
                            ),
                          ),
                        ),

                        // Text Container
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                      text: recommendedProduct
                                          .recommendedProductList[index].name!),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  SmallText(
                                      text: "With Chinese Characteristics"),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  BottomContainerIconAndText()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                },
              )
            : CircularProgressIndicator(
                color: AppColors.kmainColor,
              );
      },
    );
  }
}
