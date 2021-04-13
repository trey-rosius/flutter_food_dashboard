import 'package:flutter/material.dart';
import 'package:food_dashboard/model/item.dart';

class Order{


  final String orderNo;
  final String orderDate;
  final String total;
  final String orderedBy;

  final List<Item> items;

  Order({ @required this.orderNo, @required this.orderDate,
  @required this.total, @required this.orderedBy,@required this.items});

  factory Order.fromJson(Map<String,dynamic> json){
     var parsedItems = json['items'].cast<Map<String, dynamic>>();

    return Order(orderNo: json['order_no'],
        orderDate: json['order_date'],
        total: json['total'], orderedBy: json['ordered_by'],
      items: parsedItems.map<Item>((json) => Item.fromJson(json)).toList()

    );
  }
}