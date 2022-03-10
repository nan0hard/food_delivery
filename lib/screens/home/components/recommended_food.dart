// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/components/upper_container.dart';
import 'bottom_container.dart';

class RecommendedFood extends StatelessWidget {
  const RecommendedFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UpperContainer(),
        BottomContainer(),
      ],
    );
  }
}
