import 'package:flutter/cupertino.dart';

class Item{
  final String name;
  final String pic;
  final String price;
  final String description;
  final int qty;

  Item({@required this.name, @required this.pic, @required this.price,
  @required this.description, @required this.qty});

  factory Item.fromJson(Map<String,dynamic> json){
    return Item(name: json['name'], pic: json['pic'], price: json['price'],
        description: json['desc'], qty: json['qty']);
  }
}