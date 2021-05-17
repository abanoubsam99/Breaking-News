import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/Wall%20Street/WallStreetNewsModel/WallStreetNewsModel.dart';

class WallStreetNewsController{
  Future<WallStreetNewsModel> GetController() async {
    var dio = Dio();
    WallStreetNewsModel _WallStreetnewsModel= WallStreetNewsModel();
    var id="ec1d5c8780fa46439440bf3b476bd382";
    var url="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=";
    final response = await dio.get(url+id);
    var data=json.decode(response.toString());
    _WallStreetnewsModel=WallStreetNewsModel.fromJson(data);
    return _WallStreetnewsModel;
  }
}
