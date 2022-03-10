import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.pageViewContainer,
      margin: EdgeInsets.only(
        left: Dimensions.width10,
        right: Dimensions.width10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        color: Colors.blueGrey,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/food0.png"),
        ),
      ),
    );
  }
}
