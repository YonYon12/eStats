import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectesports/testingthings/gettingPlayers.dart';

import '../classes/players.dart';
import '../classes/team.dart';


Future<List<Team>> populateTeams() async {
  List<Team> dotaTeamList = List.of(<Team>[]);
  List<List> dotaPlayerList = List.of(<List>[]);

  final response = await http.get(Uri.parse('https://api.opendota.com/api/teams'));
  var decodedString = json.decode(response.body);
  //print(decodedString);

  for(int i = dotaTeamList.length; i < 34; i++){
    var subStr = decodedString[i];
    if(subStr['name'] != '' && subStr['losses'] > 10){
      String teamId = subStr['team_id'].toString();
      String teamName = subStr['name'].toString();
      //print(teamId);

      print('starting call');
      dotaTeamList.add(Team.fromJson(decodedString[i], await populatePlayers(teamId, teamName)));
      if(dotaTeamList.last.playerList.length == 0){
        dotaTeamList.remove(dotaTeamList.last);
      }
    }
  }

  return dotaTeamList;

}