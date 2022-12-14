import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:instagram/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage=0;
  bool darkMod=true;
  List<FeedPage> _pages=[];

  void a() {
    _pages=[
      FeedPage(darkMode: darkMod),
      FeedPage(darkMode: darkMod,),
      FeedPage(darkMode: darkMod,),
      FeedPage(darkMode: darkMod,),
      FeedPage(darkMode: darkMod,),
    ];
  }

  @override
  void initState() {
    a();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkMod? Colors.white:Colors.black,
        title: Text('Instagram',style: TextStyle(color: darkMod? Colors.black:Colors.grey,),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            setState(() {
              darkMod=!darkMod;
              a();
            });
          },
          icon: Icon(Icons.camera_alt_outlined,color: darkMod? Colors.black:Colors.grey,),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.live_tv,color:darkMod? Colors.black:Colors.grey,),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Linecons.paper_plane,color:darkMod? Colors.black:Colors.grey,),
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentPage=value;
          });
        },
        backgroundColor: darkMod? Colors.white:Colors.black,
        currentIndex: _currentPage,
        unselectedItemColor: darkMod? Colors.grey:Colors.grey,
        selectedItemColor: darkMod? Colors.black:Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Upload'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Likes'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Person'
          ),
        ],
      ),
    );
  }
}
