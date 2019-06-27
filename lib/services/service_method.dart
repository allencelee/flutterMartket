import 'package:dio/dio.dart';
import 'package:flutter_shop/config/httpHeaders.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获取首页主体内容
Future getHomePageContent() async {
  try {
    print('开始获取首页数据.........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    // dio.options.headers = httpHeaders;
    var formData = {'lon': '116.30390167236328', 'lat': '39.98295211791992'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  } catch (e) {
    return print('ERROR: =======>${e}');
  }
}

//获取首页火爆专区数据
Future getHomePageBeloConten() async {
  try {
    print('开始获取火爆专区数据.........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    // dio.options.headers = httpHeaders;
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  } catch (e) {
    return print('ERROR: =======>${e}');
  }
}

//用大括号表示可选参数
Future request(url,{formData}) async{
    try {
    print('开始获取数据.........${url}');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded');
    // dio.options.headers = httpHeaders;
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url],data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
  } catch (e) {
    return print('ERROR: =======>${e}');
  }
}