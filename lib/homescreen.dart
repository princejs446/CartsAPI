import 'dart:convert';

import 'package:api_example3/carts.dart';
import 'package:api_example3/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Homescreen  extends StatefulWidget{
  const Homescreen({super.key});
  
  @override  
  State<Homescreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<Homescreen>{
  bool _isLoading=true;

  @override  
  void initState(){
    super.initState();
    _getData();
  }
  CartsModelApi?dataFormAPI;

  _getData()async{
    try{
      String url="https://dummyjson.com/carts";
      http.Response res =await http.get(Uri.parse(url));
      if(res.statusCode==200){
        dataFormAPI=CartsModelApi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }
  @override  
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api Example",
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Colors.red,
      ),
      body: _isLoading
      ?const Center(
        child: CircularProgressIndicator(),
      )
      :dataFormAPI==null? const Center(
        child: Text("Failed to load data"),
      )
      :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        ),
        itemCount: dataFormAPI!.carts.length,
         itemBuilder: (context,index){
          final cart = dataFormAPI!.carts[index];

          final firstProduct=cart.products.isNotEmpty?cart.products[0]:null;
          return firstProduct==null?const SizedBox.shrink()
          
          : GestureDetector(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context)=>CartDetailPage(carts: cart,)));
            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black,
                width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    spreadRadius: 1,
                  )
                ]
              ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(firstProduct.thumbnail,width: 100,height: 100),   
                  SizedBox(height: 10),
                  Text(firstProduct.title),
                  SizedBox(height: 5),
                  Row(children: [
                 Text("\$${firstProduct.price}"),
                 SizedBox(width: 25),
                  ],
                  ),
                ],
              ),
            ),
          );
         },
         ),
    );
  }
  }