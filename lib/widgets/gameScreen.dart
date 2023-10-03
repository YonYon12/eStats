import 'package:flutter/material.dart';
import 'package:projectesports/widgets/TeamListPage.dart';
import 'package:projectesports/widgets/title.dart';

import '../classes/team.dart';

class GamePage extends StatelessWidget {
  List<Team> tList;
  GamePage({super.key, required this.tList});

  List<String> gameList = [
    'data:image/jpeg;base64,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',
    'data:image/jpeg;base64,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',
    'data:image/png;base64,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',
    'data:image/png;base64,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'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
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
            titleWidget(title: 'Games'),
            Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  children: [
                    for(int i = 0; i < gameList.length; i++)...[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => teamList(tList: tList)),
                          );
                        }, // add so it moves to that game page with teams
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            '${gameList[i]}',
                            width: 150,
                            height: 150,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ]

                  ],
                ))
          ],
        ),
      ),
    );
  }
}