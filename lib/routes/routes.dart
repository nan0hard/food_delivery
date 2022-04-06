import 'package:food_delivery/screens/PopularFoodDetails/popular_food_details.dart';
import 'package:food_delivery/screens/RecommendedFoodDetails/recommended_food_details.dart';
import 'package:food_delivery/screens/cart/cart_screen.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cart = "/cart";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCart() => "$cart";

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cart,
      page: () {
        return CartScreen();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
