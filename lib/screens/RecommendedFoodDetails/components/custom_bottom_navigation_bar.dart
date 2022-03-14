// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/RecommendedFoodDetails/components/pricing_section.dart';
import '../../../components/wishlist_and_pricing_bottombar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PricingSection(),
        WishlistAndPricingBottomBar(),
      ],
    );
  }
}
