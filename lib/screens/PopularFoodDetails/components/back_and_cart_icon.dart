// import 'package:flutter/material.dart';
// import 'package:food_delivery/components/big_text.dart';
// import 'package:food_delivery/controllers/popular_product_controller.dart';
// import 'package:food_delivery/routes/routes.dart';
// import 'package:food_delivery/screens/cart/cart_screen.dart';
// import 'package:food_delivery/screens/home/home_page.dart';
// import 'package:food_delivery/utils/colors.dart';
// import 'package:get/get.dart';

// import '../../../components/app_icon.dart';
// import '../../../utils/dimensions.dart';

// class BackAndCartIcon extends StatelessWidget {
//   const BackAndCartIcon({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: Dimensions.height45,
//       left: Dimensions.width20,
//       right: Dimensions.width20,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//               if (page == 'cartPage') {
                
//               }
//             },
//             child: AppIcon(
//               icon: Icons.arrow_back_ios,
//               iconSize: Dimensions.iconSize16,
//             ),
//           ),
//           GetBuilder<PopularProductController>(
//             builder: (controller) {
//               return Stack(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       if (controller.totalItems >= 1) {
//                         Get.toNamed(Routes.getCart());
//                       }
//                     },
//                     child: AppIcon(
//                       icon: Icons.shopping_cart_outlined,
//                       iconSize: Dimensions.iconSize16,
//                     ),
//                   ),
//                   controller.totalItems >= 1
//                       ? Positioned(
//                           right: 0,
//                           top: 0,
//                           child: AppIcon(
//                             icon: Icons.circle,
//                             size: 20,
//                             iconColor: Colors.transparent,
//                             backgroundColor: AppColors.kmainColor,
//                           ),
//                         )
//                       : Container(),
//                   controller.totalItems >= 1
//                       ? Positioned(
//                           right: 6.5,
//                           top: 3.5,
//                           child: BigText(
//                             text: Get.find<PopularProductController>()
//                                 .totalItems
//                                 .toString(),
//                             size: 12,
//                             color: Colors.white,
//                           ),
//                         )
//                       : Container(),
//                 ],
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
