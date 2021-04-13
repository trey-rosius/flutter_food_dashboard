import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:food_dashboard/model/order.dart';


final String getOrdersUrl = "https://suczbh984e.execute-api.us-east-2.amazonaws.com/dev/orders";


// A function that converts a response body into a List<Order>.
List<Order> parseOrders(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Order>((json) => Order.fromJson(json)).toList();
}

Future<List<Order>> fetchOrders(http.Client client) async {
  final response = await client
      .get(Uri.parse(getOrdersUrl),headers: {
    "x-api-key":"8ZvY9h9IVx4r7501GZ5Ep6DNOFih5Hkr7183q7br"
  } );

  return compute(parseOrders,response.body);
}