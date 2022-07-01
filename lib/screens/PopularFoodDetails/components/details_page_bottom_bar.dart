// import 'package:flutter/material.dart';
// import 'package:food_delivery/controllers/popular_product_controller.dart';
// import 'package:get/get.dart';

// import '../../../components/big_text.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/dimensions.dart';

// class DetailsPageBottomBar extends StatelessWidget {
//   DetailsPageBottomBar({
//     Key? key,
//     required this.pageId,
//   }) : super(key: key);

//   int pageId;
//   @override
//   Widget build(BuildContext context) {
//     var product =
//         Get.find<PopularProductController>().popularProductList[pageId];
//     return Container(
//       height: Dimensions.bottomHeightBar,
//       padding: EdgeInsets.only(
//           top: Dimensions.height30,
//           bottom: Dimensions.height30,
//           left: Dimensions.width20,
//           right: Dimensions.width20),
//       decoration: BoxDecoration(
//         color: AppColors.kbuttonBackgroundColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(Dimensions.radius20 * 2),
//           topRight: Radius.circular(Dimensions.radius20 * 2),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: EdgeInsets.all(Dimensions.height20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(Dimensions.radius20),
//               color: Colors.white,
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.remove,
//                   color: AppColors.ksignColor,
//                 ),
//                 SizedBox(
//                   width: Dimensions.width10 / 2,
//                 ),
//                 BigText(text: "0"),
//                 SizedBox(
//                   width: Dimensions.width10 / 2,
//                 ),
//                 Icon(
//                   Icons.add,
//                   color: AppColors.ksignColor,
//                 )
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(Dimensions.height20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(Dimensions.radius20),
//               color: AppColors.kmainColor,
//             ),
//             child: BigText(
//               text: "\$10 | Add to Cart",
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
