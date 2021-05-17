import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/TechCrunch/TechCrunchNewsModel/TechCrunchNewsModel.dart';

class TechCrunchNewsController{
  Future<TechCrunchNewsModel> GetController() async {
    var dio = Dio();
    TechCrunchNewsModel _techcrunchnewsModel= TechCrunchNewsModel();
    var id="ec1d5c8780fa46439440bf3b476bd382";
    var url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=";
    final response = await dio.get(url+id);
    var data=json.decode(response.toString());
    _techcrunchnewsModel=TechCrunchNewsModel.fromJson(data);
    return _techcrunchnewsModel;
  }
}
