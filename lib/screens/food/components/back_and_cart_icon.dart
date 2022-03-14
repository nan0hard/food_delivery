import 'package:flutter/material.dart';

import '../../../components/app_icon.dart';
import '../../../utils/dimensions.dart';

class BackAndCartIcon extends StatelessWidget {
  const BackAndCartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Dimensions.height45,
        left: Dimensions.width20,
        right: Dimensions.width20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(
              icon: Icons.arrow_back_ios,
              iconSize: Dimensions.iconSize16,
            ),
            AppIcon(
              icon: Icons.shopping_cart_outlined,
              iconSize: Dimensions.iconSize16,
            ),
          ],
        ));
  }
}
