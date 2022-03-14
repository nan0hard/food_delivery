import 'package:flutter/material.dart';

import '../../../components/app_icon.dart';
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
        AppIcon(
          icon: Icons.clear,
          iconSize: Dimensions.iconSize16,
        ),
        AppIcon(
          iconSize: Dimensions.iconSize16,
          icon: Icons.shopping_cart_outlined,
        )
      ],
    );
  }
}
