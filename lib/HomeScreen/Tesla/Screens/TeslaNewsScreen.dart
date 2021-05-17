
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/News/Controller/NewsController.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/News/Widgets/NewsItem.dart';
import 'package:news_app/HomeScreen/Tesla/Controller/TeslaNewsController.dart';
import 'package:news_app/HomeScreen/Tesla/TeslaNewsModel/TeslaNewsModel.dart';
class TeslaNewsScreen extends StatefulWidget {

  @override
  _TeslaNewsScreenState createState() => _TeslaNewsScreenState();
}

class _TeslaNewsScreenState extends State<TeslaNewsScreen> {
  TeslaNewsController _teslaNewsController= TeslaNewsController();

  TeslaNewsModel _teslaNewsModel=TeslaNewsModel();
  bool _loading=true;

  _getNews () async{
    _teslaNewsModel=await _teslaNewsController.GetController();
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
          itemCount: _teslaNewsModel.articles.length,
          itemBuilder: (context, index) {
            return NewItem(
              url: _teslaNewsModel.articles[index].urlToImage,
              context: context,
              content: _teslaNewsModel.articles[index].description,
              title: _teslaNewsModel.articles[index].title,
              description:  _teslaNewsModel.articles[index].description,
              name:  _teslaNewsModel.articles[index].author,
              publishedAt:  _teslaNewsModel.articles[index].publishedAt,
            );
          },
        ),
      ),
    );
  }
}

