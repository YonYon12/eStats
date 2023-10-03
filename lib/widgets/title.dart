import 'package:flutter/material.dart';

class titleWidget extends StatefulWidget {
  String title;
  titleWidget({super.key, required this.title});

  @override
  State<titleWidget> createState() => _titleWidgetState();
}
class _titleWidgetState extends State<titleWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1, -1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 30),
        child: Text(
          '${widget.title}',
          style: TextStyle(
            fontFamily: 'Readex Pro',
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
