import 'package:flutter/material.dart';
import 'package:projectesports/widgets/TeamListPage.dart';
import 'package:projectesports/widgets/playerCard.dart';
import 'package:projectesports/widgets/statBox.dart';
import 'package:projectesports/widgets/title.dart';

import '../classes/players.dart';
import '../classes/team.dart';
import 'PlayerScreen.dart';

class esportsTeam extends StatefulWidget {
  Team team;
  esportsTeam({super.key, required this.team});

  @override
  State<esportsTeam> createState() => _esportsTeamState();
}

class _esportsTeamState extends State<esportsTeam> {
  List<String> playerList = List.of(<String>[]);
  var winPer;

  _playerPage(BuildContext context, Widget page) async {
    final data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ) ;
    // Here we have the data from the second screen
    //widget = data;

  }

  @override
  void initState() {
    playerList.add('here');
    playerList.add('here2');
    playerList.add('here3');
    playerList.add('here4');


    widget.team.wins as double;
    winPer = (widget.team.wins as double) / (widget.team.losses as double);
    super.initState();
  }
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
        child: Column(
          children: [
            titleWidget(title: '${widget.team.name}'),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${widget.team.logo}',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(child: GridView.count(
              crossAxisCount: 3,
              physics:  NeverScrollableScrollPhysics(),
              children: [
                StatBox(stat: 'WinPercent', data: '${winPer.toString()}'),
                StatBox(stat: 'Wins', data: '${widget.team.wins.toString()}'),
                StatBox(stat: 'Losses', data: '${widget.team.losses.toString()}'),
              ],
            )),
            titleWidget(title: 'Players'),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  //make a for loop to do it based on players
                  for(Player i in widget.team.playerList)...[
                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlayerPage(player: i, winpercent: winPer.toString())),
                        );
                      }, // add so it moves to that player page with teams
                      child: PlayerCard(position: '', name: '${i.name}'),
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
