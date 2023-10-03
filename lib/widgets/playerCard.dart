import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  String position;
  String name;
  PlayerCard({super.key, required this.position, required this.name});

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.name}     ',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'Position: ${widget.position}',
            style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 20,
                color: Colors.white,
            ),
          ),
        ],
      ),
    );;
  }
}
