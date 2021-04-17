import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify_clone/json/sons.dart';
import 'package:spotify_clone/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;

  String _search;
  int _offset = 0;


  Future <Map> _getMusic()async {

    http.Response response;

    if(_search == null)
      response = await http.get("https://api.spotify.com/v1/$_search?query=tania+bowra&offset=0&limit=20&type=artist");
    else 
      response = await http.get("https://api.spotify.com/v1/artists/6sFIWsNpZYqfjUpaCgueju");

    return json.decode(response.body);
  }
  
  @override
  void initState(){
    super.initState();
    _getMusic().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title:Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Bom dia",
            style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
          ),
          Icon(CupertinoIcons.list_bullet)
        ],
      ),
    ),);
  }

  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(song_type_1.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                activeMenu1 = index;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song_type_1[index], style:
                                TextStyle(
                                  fontSize: 15.0,
                                  color: activeMenu1 == index ? primary : Colors.grey,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                SizedBox(height: 3.0,),
                                activeMenu1 == index ? Container(
                                  width: 10.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(5)
                                      ),

                                ) : Container()
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: List.generate(songs.length - 5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: GestureDetector(
                            onTap: (){},
                            child: Column(
                              children: [
                                Container(
                                  width: 180.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          songs[index]['img']), fit: BoxFit.cover),
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ]
          )
        ],
      ),
    );
  }
}
