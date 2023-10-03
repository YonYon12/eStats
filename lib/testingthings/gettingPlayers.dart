import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../classes/players.dart';
import '../classes/team.dart';


Future<List<Player>> populatePlayers(String teamId, String TeamName) async {
  List<Player> dotaPlayerList = List.of(<Player>[]);
  String curMember = '';

  final response2 = await http.get(Uri.parse('https://api.opendota.com/api/teams/$teamId/players'));
  var decodedString2 = json.decode(response2.body);

  for(int x = 0; x < decodedString2.length; x++){
    var subStr2 = decodedString2[x];
    //print('in call ${subStr2}');
    if(subStr2['is_current_team_member'] != null){
      curMember = subStr2['is_current_team_member'].toString();
      //print('in null check $curMember');
    }
    if(curMember == 'true'){
      // print(subStr2['name']);
      dotaPlayerList.add(Player.fromJson(TeamName, decodedString2[x]));
      //print(dotaPlayerList);
    }
    //print('here in call');
  }

  return dotaPlayerList;
}