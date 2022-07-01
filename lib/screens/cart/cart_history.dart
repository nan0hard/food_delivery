import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/big_text.dart';
import 'package:food_delivery/components/small_text.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../routes/routes.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height20 * 6,
            color: AppColors.kmainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.kmainColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    for (var i = 0; i < cartItemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height20 * 7,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parseDate =
                                  DateFormat("yyyy-MM-HH HH:mm:ss").parse(
                                      getCartHistoryList[listCounter].time!);
                              var inputDate =
                                  DateTime.parse(parseDate.toString());
                              var outputFormat =
                                  DateFormat("dd-MM-yyyy    hh:mm a");
                              var outputDate = outputFormat.format(inputDate);
                              return BigText(text: outputDate);
                            }()),
                            // SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: Dimensions.height20 * 4,
                                            width: Dimensions.width20 * 4,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width10 / 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    getCartHistoryList[
                                                            listCounter - 1]
                                                        .img!),
                                              ),
                                            ),
                                          )
                                        : Container();
                                  }),
                                ),
                                Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(
                                        text: "Total",
                                        color: AppColors.ktitleColor,
                                      ),
                                      if (itemsPerOrder[i] == 1)
                                        BigText(
                                          text: itemsPerOrder[i].toString() +
                                              " item",
                                          color: AppColors.ktitleColor,
                                        )
                                      else
                                        BigText(
                                          text: itemsPerOrder[i].toString() +
                                              " items",
                                          color: AppColors.ktitleColor,
                                        ),
                                      GestureDetector(
                                        onTap: () {
                                          var orderTime = cartOrderTimeToList();
                                          Map<int, CartModel> moreOrders = {};

                                          for (var j = 0;
                                              j < getCartHistoryList.length;
                                              j++) {
                                            if (getCartHistoryList[j].time ==
                                                orderTime[i]) {
                                              moreOrders.putIfAbsent(
                                                  getCartHistoryList[j].id!,
                                                  () => CartModel.fromJson(
                                                      jsonDecode(jsonEncode(
                                                          getCartHistoryList[
                                                              j]))));
                                            }
                                          }
                                          Get.find<CartController>().setItems =
                                              moreOrders;
                                          Get.find<CartController>()
                                              .addToCartList();

                                          Get.toNamed(Routes.getCart());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical:
                                                  Dimensions.height10 / 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15 / 3),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.kmainColor),
                                          ),
                                          child: SmallText(
                                            text: "Order Again!",
                                            color: AppColors.kmainColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
