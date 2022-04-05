import 'package:food_delivery/screens/PopularFoodDetails/popular_food_details.dart';
import 'package:food_delivery/screens/RecommendedFoodDetails/recommended_food_details.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
