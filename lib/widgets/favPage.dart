import 'package:flutter/material.dart';
import 'package:projectesports/widgets/statBox.dart';
import 'package:projectesports/widgets/title.dart';
import '../classes/players.dart';
import 'PlayerScreen.dart';

class favPage extends StatefulWidget {
  List<Player> favList;
  List<dynamic> winPerList;
  favPage({super.key, required this.favList, required this.winPerList});

  @override
  State<favPage> createState() => _favPageState();
}

class _favPageState extends State<favPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
          {
            Navigator.pop(context)
          },
        ),
        backgroundColor: Colors.grey,
        title: const Text(
            'eStats',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22
            )
        ),
      ),
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            titleWidget(title: 'Favorite Players'),
            for(int i = 0; i < widget.favList.length; i++)...[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerPage(player: widget.favList[i], winpercent: '50%',)),
                  );
                }, // go to team page for that game
                child: Card(
                  color: Colors.black, // make so it is random colors
                  child: Text(
                    '${widget.favList[i].name}',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
