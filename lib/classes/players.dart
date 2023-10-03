import 'package:flutter/material.dart';

class Player{
  var team;
  var name;
  var gamesplayed;
  var wins;
  var curPlayer;
  //var winpercent;


  Player(this.team, this.name, this.gamesplayed, this.wins, this.curPlayer);

  factory Player.fromJson(var teamName, Map<String, dynamic> json){
    return Player(teamName, (json['name']), (json['games_played']), (json['wins']), (json['is_current_team_member']));
  }
}