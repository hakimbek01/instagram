import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:instagram/model/post_model.dart';
import 'package:instagram/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _story=[
    Story(
      userImage: 'assets/images/user_1.jpeg',
      name: 'Jenni'
    ),
    Story(
      userImage: 'assets/images/user_2.jpeg',
      name: 'Also'
    ),
    Story(
        userImage: 'assets/images/user_3.jpeg',
        name: 'Emma'
    ),
    Story(
      userImage: 'assets/images/img.png',
      name: 'A.U.E'
    )
  ];

  List<Post> _post=[
    Post(
      userImage: 'assets/images/user_3.jpeg',
      postImage: 'assets/images/feed_3.jpeg',
      userName: 'Anna',
      comment: 'Flutter — комплект средств разработки и фреймворк с открытым исходным кодом для создания мобильных приложений под Android и iOS, веб-приложений, а также настольных приложений под Windows, macOS и Linux с использованием языка программирования Dart, разработанный и развиваемый корпорацией Google.'
    ),
    Post(
     userImage: 'assets/images/user_2.jpeg',
     postImage: 'assets/images/feed_2.jpeg',
     userName: 'Also',
     comment: 'Первая версия выпущена в 2015 году под названием «Sky», работала только для Android-приложений. Основная заявленная особенность — высокая графическая производительность (возможность отображения 120 кадров в секунду). Полная'
    ),
    Post(
      userImage: 'assets/images/user_1.jpeg',
      postImage: 'assets/images/feed_1.jpeg',
      userName: 'Jenni',
      comment: 'поддержка создания веб-приложений появилась в версии 2.0 (март 2021 года), с этой же версии реализована поддержка создания настольных приложений для Windows, macOS и Linux и Google Fuchsia (в виртуальной машине Dart с JIT-компилятором).'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //stories
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stories',style: TextStyle(color: Colors.grey),),
                  Text('Watch all',style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _story.map((story) {
                  return _itemStories(story);
                }).toList(),
              ),
            ),
            //posts
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _post.length,
                itemBuilder: (context, index) {
                  return _itemPost(_post[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _itemStories(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purple,width: 3)
          ),
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black,width: 2),
              image: DecorationImage(
                image: AssetImage(story.userImage!),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        Text(story.name!,style: TextStyle(color: Colors.grey,fontSize: 15),)
      ],
    );
  }

  Widget _itemPost( Post post) {
    return Column(
      children: [
        //avatar name popup button
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    foregroundImage: AssetImage(post.userImage!),
                  ),
                  SizedBox(width: 10,),
                  Text(post.userName!,style: TextStyle(color: Colors.grey),)
                ],
              ),
              PopupMenuButton(
                icon: Icon(Icons.keyboard_control_outlined,color: Colors.grey,),
                color: Colors.grey.shade500,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Hello World'))
                ],
              )
            ],
          ),
        ),
        //post Image
        FadeInImage(
          placeholder: AssetImage('assets/images/placeholder.png'),
          image: AssetImage(post.postImage!),
        ),
        //iconbuttons
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Linecons.heart),
                    color: Colors.grey,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Linecons.comment),
                    color: Colors.grey
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Linecons.paper_plane),
                    color: Colors.grey,
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(CupertinoIcons.bookmark,color: Colors.grey,),
              )
            ],
          ),
        ),
        //comment
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width-20,
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Liked By ',
                                style: TextStyle(color: Colors.grey)
                            ),
                            TextSpan(
                                text: 'Lisa, ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'Kelvin, ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'Davron, ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'Uiliem, ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'Jek, ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),

                            TextSpan(
                                text: 'and ',
                                style: TextStyle(color: Colors.grey)
                            ),
                            TextSpan(
                                text: '2134 ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                            TextSpan(
                                text: 'others ',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3,),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${post.userName} ',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: post.comment,
                      style: TextStyle(color: Colors.grey)
                    )
                  ]
                ),
              ),
              SizedBox(height: 3,),
              Text('9 December 2022 ago',style: TextStyle(color: Colors.grey),)
            ],
          ),
        )
      ],
    );
  }
}
