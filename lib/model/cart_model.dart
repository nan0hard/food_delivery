class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExist,
      this.time});
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": this.id,
  //     "name": this.name,
  //     "price": this.price,
  //     "img": this.img,
  //     "quantity": this.quantity,
  //     "isExist": this.isExist,
  //     "time": this.time,
  //   };
  // }
}
