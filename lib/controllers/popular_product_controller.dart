import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      // print("Did not receive products");
    }
  }

  void setQuantity(bool isIncreased) {
    if (isIncreased) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Number of orders",
        "You can't reduce more !",
        backgroundColor: AppColors.kmainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Number of orders",
        "Sorry! The restaurant is currently not accepting order more than 20 !",
        backgroundColor: AppColors.kmainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = _inCartItems;
        return _quantity;
      }
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print("The quantity in cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      // print("The id is " +
      //     value.id.toString() +
      //     " The quantity is " +
      //     value.quantity.toString());
    });
    update();
    // } else {
    //   Get.snackbar(
    //     "Number of orders",
    //     "Atleast add 1 item in the cart",
    //     backgroundColor: AppColors.kmainColor,
    //     colorText: Colors.white,
    //   );
    // }
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
