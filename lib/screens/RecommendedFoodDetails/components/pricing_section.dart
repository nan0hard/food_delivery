import 'package:flutter/material.dart';
import '../../../components/app_icon.dart';
import '../../../components/big_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width20 * 2.5,
        vertical: Dimensions.height10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(
            icon: Icons.remove,
            backgroundColor: AppColors.kmainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.iconSize24,
          ),
          BigText(
            text: "\$19.99  X  0",
            color: AppColors.kmainBlackColor,
            size: Dimensions.font26,
          ),
          AppIcon(
            icon: Icons.add,
            iconColor: Colors.white,
            backgroundColor: AppColors.kmainColor,
            iconSize: Dimensions.iconSize24,
          )
        ],
      ),
    );
  }
}
