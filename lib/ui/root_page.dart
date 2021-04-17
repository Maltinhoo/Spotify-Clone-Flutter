import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spotify_clone/theme/colors.dart';
import 'package:spotify_clone/ui/home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int activeTab = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text("Início", style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Sua Biblioteca", style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Pesquisar", style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Configurações", style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
        )
      ],
    );

  }

  Widget getFooter(){
    List items = [
      MdiIcons.homeOutline,
      MdiIcons.bookshelf,
      CupertinoIcons.search,
      CupertinoIcons.gear
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child:Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              icon: Icon(
                items[index],
                color: activeTab == index ? primary : Colors.white,),
              onPressed: (){
                setState(() {
                  activeTab = index;
                });
              }
            );
          }),
        ),
    )
    );
  }


}
