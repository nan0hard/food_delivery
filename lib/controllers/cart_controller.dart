import 'package:flutter/material.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  //only for storage and shared preferences
  List<CartModel> storageItems = [];

  void addItem(ProductModel product, int quantity) {
    // print('Lenfth od the item is ' + _items.toString());

    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        },
      );

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            // print("Adding item to the cart id" +
            //     product.id!.toString() +
            //     "quantity " +
            //     quantity.toString());
            // _items.forEach((key, value) {
            //   print("Quantity is " + value.quantity.toString());
            // });
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar(
          "Number of orders",
          "Add alteast one item to Cart",
          backgroundColor: AppColors.kmainColor,
          colorText: Colors.white,
        );
      }
    }

    //For Cart Repo
    cartRepo.addToCartList(getItems);

    update();
  }

  bool existInCart(ProductModel productModel) {
    if (_items.containsKey(productModel.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (_items.containsKey(productModel.id)) {
      _items.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;

    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update();
  }
}
