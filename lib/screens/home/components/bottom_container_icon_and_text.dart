import 'package:flutter/material.dart';
import '../../../components/icon_and_text.dart';
import '../../../utils/colors.dart';

class BottomContainerIconAndText extends StatelessWidget {
  const BottomContainerIconAndText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
          icon: Icons.circle_sharp,
          text: "Normal",
          iconColor: AppColors.kiconColor1,
        ),
        IconAndTextWidget(
          icon: Icons.location_on,
          text: "1.7 km",
          iconColor: AppColors.kmainColor,
        ),
        IconAndTextWidget(
          icon: Icons.access_time_rounded,
          text: "32 min",
          iconColor: AppColors.kiconColor2,
        )
      ],
    );
  }
}
