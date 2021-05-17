
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/News/Controller/NewsController.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/News/Widgets/NewsItem.dart';
import 'package:news_app/HomeScreen/Wall%20Street/Controller/WallStreetNewsController.dart';
import 'package:news_app/HomeScreen/Wall%20Street/WallStreetNewsModel/WallStreetNewsModel.dart';
class WallStreetNewsScreen extends StatefulWidget {
  @override
  _WallStreetNewsScreenState createState() => _WallStreetNewsScreenState();
}

class _WallStreetNewsScreenState extends State<WallStreetNewsScreen> {
  WallStreetNewsController _WallStreetnewsController= WallStreetNewsController();
  WallStreetNewsModel _WallStreetnewsModel=WallStreetNewsModel();
  bool _loading=true;

  _getNews () async{
    _WallStreetnewsModel=await _WallStreetnewsController.GetController();
    setState(() {
      _loading=false;
    });
  }

  @override
  void initState() {
    _getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_loading ?
          Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),)
          :Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _WallStreetnewsModel.articles.length,
          itemBuilder: (context, index) {
            return NewItem(
              url: _WallStreetnewsModel.articles[index].urlToImage,
              context: context,
              content: _WallStreetnewsModel.articles[index].description,
              title: _WallStreetnewsModel.articles[index].title,
              description:  _WallStreetnewsModel.articles[index].description,
              name:  _WallStreetnewsModel.articles[index].author,
              publishedAt:  _WallStreetnewsModel.articles[index].publishedAt,
            );
          },
        ),
      ),
    );
  }
}

