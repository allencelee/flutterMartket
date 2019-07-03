import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier{
  String cartString = "[]";
  save(goodsId,goodsName,count,price,images) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null?[]:json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    tempList.forEach((item){
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count']=item['count']+1;
        isHave = true;
      }
      ival++;
    });

    if (!isHave) {
      tempList.add({});
    } else {
    }
  }
}