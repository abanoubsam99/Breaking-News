import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_app/HomeScreen/TechCrunch/Screens/TechCrunchNewsScreen.dart';
import 'file:///F:/Flutter%20Projects/Special%20Projects/news_app/lib/HomeScreen/News/Screens/NewsScreen.dart';
import 'package:news_app/HomeScreen/Tesla/Screens/TeslaNewsScreen.dart';
import 'package:news_app/HomeScreen/Wall%20Street/Screens/WallStreetNewsScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final  List<Widget> _widgetOptions = [
     NewsScreen(),
     TeslaNewsScreen(),
     TechCrunchNewsScreen(),
     WallStreetNewsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar:AppBar(
        title: Text("Breaking News"),
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/128/4412/4412371.png"),),
            ),),
        ),
        actions: [IconButton(icon:Icon(Icons.power_settings_new,color: Colors.white,) , onPressed: (){
          SystemNavigator.pop();
        })],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Theme.of(context).primaryColor,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.yahoo,
                    text: 'US News',
                  ),
                  GButton(
                    icon: LineIcons.windows,
                    text: 'TechCrunc',
                  ),
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: 'WallStreet',
                  ),
                               ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
