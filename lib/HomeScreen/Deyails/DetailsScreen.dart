
import 'package:flutter/material.dart';
import 'package:news_app/Color.dart';
import 'package:news_app/HomeScreen/HomeScreen.dart';
class DetailsScreen extends StatefulWidget {
  String title,publishedAt,image,content,description,name;
  DetailsScreen({@required this.title,@required this.description,@required this.image,@required this.content,@required this.name,@required this.publishedAt});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  Widget _dataitem(String title,IconData icon){
    return Row(children: [
      Icon(icon,color: Theme.of(context).primaryColor,size: 30,),
      SizedBox(width: 5,),
      Text(title ,style: TextStyle(color: Colors.black,fontSize: 14),)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
                image: DecorationImage(image:  NetworkImage(widget.image),
                    fit: BoxFit.fill)
            ),
          ),
          Positioned(
            top: 20,
            left: 7,
            child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
              Navigator.pop(context);
            }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2-50,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2+50,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight:  Radius.circular(50))
              ),
              child:   Padding(
                padding: const EdgeInsets.all(20),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(height: 10,),

                   Text(widget.title, style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18)),
                   SizedBox(height: 20,),

                   Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     _dataitem(widget.publishedAt, Icons.timer),
                       SizedBox(height: 10,),
                       _dataitem(widget.name, Icons.person),
                   ],),
                   SizedBox(height: 20,),
                   Expanded(child: Text( widget.content+widget.description, style: TextStyle( color: Colors.grey,fontSize: 15),overflow: TextOverflow.fade,)),

                        ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
