import 'package:projectesports/classes/players.dart';

class Team{
  var name;
  var wins;
  var losses;
  var logo;
  List<dynamic> playerList;

  Team(this.name, this.wins, this.losses, this.logo, this.playerList);

  factory Team.fromJson(Map<String, dynamic> json, List<dynamic> pList){
    return Team(
        (json['name']), (json['wins']), (json['losses']), (json['logo_url']), pList);
  }
}