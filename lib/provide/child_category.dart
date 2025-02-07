import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;  //子类高亮索引
  String categoryId = '4'; //大类Id
  String subId = ''; //小类ID
  int page = 1; //列表页数
  String noMoreText = ''; //没有数据

  //大类切换逻辑
  getChildCategory(List<BxMallSubDto> list,String id){
    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index,String id){
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  //增加page的方法
  addPage(){
    page++;
  }

  changeNoMore(String text){
    noMoreText = text;
  }
}