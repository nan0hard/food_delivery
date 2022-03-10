import 'package:flutter/material.dart';

import '../../../components/big_text.dart';
import '../../../components/small_text.dart';
import '../../../utils/dimensions.dart';
import 'bottom_container_icon_and_text.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
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
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
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
                    bottomRight: Radius.circular(Dimensions.radius20),
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
                      BigText(text: "Nutritious Fruit meal in China"),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SmallText(text: "With Chinese Characteristics"),
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
        );
      },
    );
  }
}
