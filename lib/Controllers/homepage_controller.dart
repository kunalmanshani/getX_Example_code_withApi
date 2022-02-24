import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_practice/Models/model.dart';
import 'package:http/http.dart' as http;
class homeController extends GetxController{
  var itemCount = 0.obs;
  int ListCount = 0;
  RxBool loading = true.obs;
  List<Entry> items = <Entry>[];

  @override
  void onInit(){
    super.onInit();
    getData();
  }
  // homeController(){
  //   items = RxList<Entry>();
  //   getData();
  // }
  getData() async{
    String url = 'https://api.publicapis.org/entries';
    var response = await http.get(Uri.parse(url));
    var encodeResponse = jsonDecode(response.body);
    if(response.statusCode == 200){
        print('sucess');
        var data = ApiData.fromJson(encodeResponse);
        ListCount = data.count;
        items = data.entries.obs;
        print(items.length);
        loading.value = false;
        //return data.entries;
    }
    else{
      throw Exception("error "+response.statusCode.toString());
    }
  }
  AddToCartItem(){
    itemCount++;
  }
  // addData(List data){
  //   for(int i=0; i<ListCount; i++){
  //     items.add(data[i]);
  //   }
  }
