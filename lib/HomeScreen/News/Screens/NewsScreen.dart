
import 'package:flutter/material.dart';
import 'package:news_app/Color.dart';
import 'package:news_app/HomeScreen/Deyails/DetailsScreen.dart';
import 'package:news_app/HomeScreen/News/Controller/NewsController.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/News/Widgets/NewsItem.dart';
import 'package:news_app/HomeScreen/TechCrunch/Screens/TechCrunchNewsScreen.dart';
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsController _newsController= NewsController();
  NewsModel _newsModel=NewsModel();
  bool _loading=true;

  _getNews () async{
    _newsModel=await _newsController.GetController();
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
          itemCount: _newsModel.articles.length,
          itemBuilder: (context, index) {
            return NewItem(
              url: _newsModel.articles[index].urlToImage,
              context: context,
              content: _newsModel.articles[index].description,
              title: _newsModel.articles[index].title,
              description:  _newsModel.articles[index].description,
              name:  _newsModel.articles[index].author,
              publishedAt:  _newsModel.articles[index].publishedAt,
            );
          },
        ),
      ),
    );
  }
}


