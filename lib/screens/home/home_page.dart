import 'package:flutter/material.dart';
import 'package:food_delivery/components/big_text.dart';
import 'package:food_delivery/components/small_text.dart';
import 'package:food_delivery/screens/home/components/body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height15, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'India',
                        color: AppColors.kmainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Bangalore',
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.kmainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(child: SingleChildScrollView(child: Body())),
          ],
        ),
      ),
    );
  }
}
