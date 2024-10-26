// To parse this JSON data, do
//
//     final cartsModelApi = cartsModelApiFromJson(jsonString);

import 'dart:convert';

CartsModelApi cartsModelApiFromJson(String str) => CartsModelApi.fromJson(json.decode(str));



class CartsModelApi {
    List<Cart> carts;

    CartsModelApi({
        required this.carts,
    });

    factory CartsModelApi.fromJson(Map<String, dynamic> json) => CartsModelApi(
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
    );

   
}

class Cart {
    int id;
    List<Product> products;

    Cart({
        required this.id,
        required this.products,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

  
}

class Product {
    int id;
    String title;
    double price;
    int quantity;
    double total;
    double discountPercentage;
    double discountedTotal;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.quantity,
        required this.total,
        required this.discountPercentage,
        required this.discountedTotal,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

   
}
