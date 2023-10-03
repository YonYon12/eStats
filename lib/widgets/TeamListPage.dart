import 'package:flutter/material.dart';
import 'package:projectesports/widgets/esportsTeamPage.dart';
import 'package:projectesports/widgets/gameScreen.dart';
import 'package:projectesports/widgets/title.dart';

import '../classes/team.dart';

class teamList extends StatefulWidget {
  List<Team> tList;

  teamList({super.key, required this.tList});

  @override
  State<teamList> createState() => _teamListState();
}

class _teamListState extends State<teamList> {

  List<String> teamList = ['dota', 'lol', 'here', 'here2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: BackButton(
          onPressed:() => {
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
            titleWidget(title: 'Teams By Rank'),
            for(int i = 0; i < widget.tList.length; i++)...[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => esportsTeam(team: widget.tList[i])),
                  );
                }, // go to team page for that game
                child: Card(
                  color: Colors.black, // make so it is random colors
                  child: Text(
                    '${i+1}. ${widget.tList[i].name}',
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
