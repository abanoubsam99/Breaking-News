import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/Tesla/TeslaNewsModel/TeslaNewsModel.dart';

class TeslaNewsController{
  Future<TeslaNewsModel> GetController() async {
    var dio = Dio();
    TeslaNewsModel _teslanewsModel= TeslaNewsModel();
    var id="ec1d5c8780fa46439440bf3b476bd382";
    var url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=";
    final response = await dio.get(url+id);
    var data=json.decode(response.toString());
    _teslanewsModel=TeslaNewsModel.fromJson(data);
    return _teslanewsModel;
  }
}
