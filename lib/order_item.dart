import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/item.dart';
import 'model/order.dart';

class OrderItem extends StatelessWidget {
  OrderItem(this.order);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                        Text("Order",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor)),
                        Text(order.orderNo,style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    Text(order.orderDate,style: TextStyle(fontSize: 12),),

                  ],
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.network(order.orderedBy,height: 30,width: 30,),

              )
            ],
          ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return Container(margin: EdgeInsets.only(left: 60),
                      child: Divider(color: Theme.of(context).accentColor,));
                },
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context,index){
                  List<Item> listItem = order.items;
                  return Container(

                    child: Row(
                      children: [
                        Container(
                          padding:EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            child: SizedBox(


                                child: Image.network(listItem[index].pic,fit: BoxFit.cover,height: 40,width: 40,)),

                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listItem[index].name,style: TextStyle(fontSize: 12),),
                              Text(listItem[index].description,style: TextStyle(color: Colors.grey),),
                              Container(

                                padding:EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children: [
                                    Text(listItem[index].price,style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),),
                                    Row(
                                      children: [
                                        Text("Qty:"),
                                        Text(listItem[index].qty.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },itemCount: order.items.length,),
            )
        ],),
      ),
    );
  }
}
