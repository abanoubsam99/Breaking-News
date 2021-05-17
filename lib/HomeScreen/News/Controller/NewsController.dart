import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';

class NewsController{
  Future<NewsModel> GetController() async {
    var dio = Dio();
    NewsModel _newsModel= NewsModel();
    var id="ec1d5c8780fa46439440bf3b476bd382";
    var url="https://newsapi.org/v2/everything?q=apple&from=2021-05-16&to=2021-05-16&sortBy=popularity&apiKey=";
    final response = await dio.get(url+id);
    var data=json.decode(response.toString());
    _newsModel=NewsModel.fromJson(data);
    return _newsModel;
  }
}
