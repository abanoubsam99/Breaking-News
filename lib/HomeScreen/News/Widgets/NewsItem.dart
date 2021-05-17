import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/Deyails/DetailsScreen.dart';

NewItem({String url,BuildContext context,String content,String title,String description,String name,String publishedAt }){
  return InkWell(
    onTap: (){

      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
          DetailsScreen(title: title, description: description, image: url, content: content, name: name, publishedAt: publishedAt)));

    },
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Container(        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.2, .2), //(x,y)
                blurRadius: 2.0,
              ),
            ]
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(15)),
                  image: DecorationImage(image:  NetworkImage(url),
                      fit: BoxFit.fitWidth)
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(title, style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),overflow: TextOverflow.ellipsis,)),
                ],),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 5,right: 10,left: 10),
                child: Text(content,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),


          ],
        ),
      ),
    ),
  );
}
