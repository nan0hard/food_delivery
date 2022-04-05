import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

import '../../../components/app_icon.dart';
import '../../../components/big_text.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class ClearAndCartIcon extends StatelessWidget {
  const ClearAndCartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getInitial());
          },
          child: AppIcon(
            icon: Icons.clear,
            iconSize: Dimensions.iconSize16,
          ),
        ),
        // AppIcon(
        //   iconSize: Dimensions.iconSize16,
        //   icon: Icons.shopping_cart_outlined,
        // )
        GetBuilder<PopularProductController>(
          builder: (controller) {
            return Stack(
              children: [
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconSize: Dimensions.iconSize16,
                ),
                Get.find<PopularProductController>().totalItems >= 1
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
                Get.find<PopularProductController>().totalItems >= 1
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
    );
  }
}
