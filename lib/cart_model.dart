import 'package:flutter/material.dart';

class Cart {
  late final String? id;
  final String? productId;
  final String? productName;
  final int? InitialPrice;
  final int? ProductPrice;
  final int? Quantity;
  final String? unitTag;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.InitialPrice,
    required this.ProductPrice,
    required this.Quantity,
    required this.unitTag,
    required this.image,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        InitialPrice = res['InitialPrice'],
        ProductPrice = res['ProductPrice'],
        Quantity = res['Quantity'],
        unitTag = res['unitTag'],
        image = res['image'];

  Map<String, Object> ToMap() {
    return {
      'Id': 'Id',
      'productId' : 'productId',
      'productName': 'productName',
      'InitialPrice': 'InitialPrice',
      'ProductPrice': 'ProductPrice',
      'Quantity': 'Quantity',
      'unitTag': 'unitTag',
      'image': 'image',
    };
  }
}
