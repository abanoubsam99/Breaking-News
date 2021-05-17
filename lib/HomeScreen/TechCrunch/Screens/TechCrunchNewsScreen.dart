
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/News/Controller/NewsController.dart';
import 'package:news_app/HomeScreen/News/NewsModel/NewsModel.dart';
import 'package:news_app/HomeScreen/News/Widgets/NewsItem.dart';
import 'package:news_app/HomeScreen/TechCrunch/Controller/TechCrunchNewsController.dart';
import 'package:news_app/HomeScreen/TechCrunch/TechCrunchNewsModel/TechCrunchNewsModel.dart';
class TechCrunchNewsScreen extends StatefulWidget {
  @override
  _TechCrunchNewsScreenState createState() => _TechCrunchNewsScreenState();
}

class _TechCrunchNewsScreenState extends State<TechCrunchNewsScreen> {
  TechCrunchNewsController _techCrunchNewsController= TechCrunchNewsController();
  TechCrunchNewsModel _techCrunchNewsModel=TechCrunchNewsModel();
  bool _loading=true;

  _getNews () async{
    _techCrunchNewsModel=await _techCrunchNewsController.GetController();
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
          itemCount: _techCrunchNewsModel.articles.length,
          itemBuilder: (context, index) {
            return NewItem(
              url: _techCrunchNewsModel.articles[index].urlToImage,
              context: context,
              content: _techCrunchNewsModel.articles[index].description,
              title: _techCrunchNewsModel.articles[index].title,
              description:  _techCrunchNewsModel.articles[index].description,
              name:  _techCrunchNewsModel.articles[index].author,
              publishedAt:  _techCrunchNewsModel.articles[index].publishedAt,
            );
          },
        ),
      ),
    );
  }
}

