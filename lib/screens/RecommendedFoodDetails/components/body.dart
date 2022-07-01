// import 'package:flutter/material.dart';
// import 'package:food_delivery/controllers/popular_product_controller.dart';
// import 'package:get/get.dart';
// import '../../../components/big_text.dart';
// import '../../../components/expandable_text.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/dimensions.dart';
// import 'clear_and_cart_icon.dart';

// class Body extends StatelessWidget {
//   const Body({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           automaticallyImplyLeading: false,
//           toolbarHeight: Dimensions.height30 * 2 + Dimensions.height10,
//           title: ClearAndCartIcon(),
//           pinned: true,
//           backgroundColor: AppColors.kyellowColor,
//           expandedHeight: 300,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Image.asset(
//               "assets/image/food0.png",
//               width: double.maxFinite,
//               fit: BoxFit.cover,
//             ),
//           ),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(Dimensions.height20),
//             child: Container(
//               child: Center(
//                   child: BigText(
//                 text: "Mac And Cheese",
//                 size: Dimensions.font26,
//               )),
//               width: double.infinity,
//               padding: EdgeInsets.only(
//                 top: Dimensions.height10 / 2,
//                 bottom: Dimensions.height10,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(Dimensions.radius20),
//                   topRight: Radius.circular(Dimensions.radius20),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(
//                     left: Dimensions.width20, right: Dimensions.width20),
//                 child: const ExpandableText(
//                     text:
//                         "Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy.Nitish is a good boy."),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
