
import 'package:flutter_test/flutter_test.dart';
import 'package:food_dashboard/config.dart';

import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../lib/api.dart';


import '../lib/model/order.dart';


// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])

class MockitoClient extends Mock implements http.Client{

}
void main(){

group('fetch orders',(){
  test('returns a list of orders if http call completes successfully', () async{

     http.Client mockitoClient = MockitoClient();

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(mockitoClient.get(Uri.parse("https://suczbh984e.execute-api.us-east-2.amazonaws.com/dev/orders"),headers: {
      "x-api-key":Config.API_KEY
    })).thenAnswer((_) async => http.Response(
         ' [{ "total": "26.40","order_date": "12 jan 2021, 08:28pm",'
             '"order_no": "#6758",'
             '"ordered_by": "https://rosius.s3.us-east-2.amazonaws.com/cropped_rosius.png",'
             '"items": ['
             '{ "name": "Vegetable Mixups","pic": "https://rosius.s3.us-east-2.amazonaws.com/meal1+(1).jpg","price": "\$10.20","desc": "Vegetable Fritters with Egg","qty": 5},'
        '{'
       ' "name": "Chicken Mixed Salad","pic": "https://rosius.s3.us-east-2.amazonaws.com/meal4+(1).jpeg","price": "\$16.20","desc": "Roasted Chicken, mixed with salad","qty": 2}'
             ']'
             '}]' ,200));

    final data = await fetchOrders(mockitoClient);

    Order order = data[0];

    expect(order.orderNo,"#6758");


  });

  test('throws an exception if the http call completes with an error', () {
    http.Client mockitoClient = MockitoClient();

    // Use Mockito to return an unsuccessful response when it calls the
    // provided http.Client.
    when(mockitoClient.get(Uri.parse("https://suczbh984e.execute-api.us-east-2.amazonaws.com/dev/orders"),headers: {
      "x-api-key":Config.API_KEY
    }))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    expect(fetchOrders(mockitoClient), throwsException);
  });



});


}