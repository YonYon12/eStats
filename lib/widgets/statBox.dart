import 'package:flutter/material.dart';

class StatBox extends StatefulWidget {
  String stat;
  String data;
  StatBox({super.key, required this.stat, required this.data});

  @override
  State<StatBox> createState() => _StatBoxState();
}

class _StatBoxState extends State<StatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '${widget.stat}',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 22,
            ),
          ),
          Text(
            '${widget.data}',
            style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 20,
                color: Colors.blue
            ),
          ),
        ],
      ),
    );
  }
}
