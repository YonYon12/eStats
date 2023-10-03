import 'package:flutter/material.dart';
import 'package:projectesports/widgets/statBox.dart';
import 'package:projectesports/widgets/title.dart';

import '../classes/players.dart';

class PlayerPage extends StatefulWidget {
  Player player;
  String winpercent;
  //List<Player> favList;

  PlayerPage({super.key, required this. player, required this.winpercent});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        shadowColor: Colors.black,
        leading: BackButton(
          onPressed:() => {
            Navigator.pop(context)
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  final snackBar = SnackBar(
                    content: const Text('Added to Favorites'),
                    action: SnackBarAction(
                      label: 'close',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Icon(
                  Icons.star_border,
                  size: 26.0,
                ),
              )
          ),
        ],
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
            titleWidget(title: '${widget.player.name}'),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAH0AAAB9CAMAAAC4XpwXAAAAMFBMVEXk5ueutLeqsbTT1tjn6erLz9Hh4+Ta3d60ubzq7O24vcCorrLEyMq/w8XIzM7e4OKMvCcSAAACt0lEQVRoge2aSZbjIAxAGcRgBvv+t21IXJ10JQHkSPai+Zt6tfoIyTJGEWIymUwmk8lkMpn8j8CdK8yLdSblwqqdWM51b8ZL9ReZtThtC8BlqeQzSvnVnuIHm9W/7vsCpDlBv+h37pvfb+z+HN+7K5E5fBs+BL6Hv3LqrW/KefXQk3NuPuSuvOg1jx7MgLywsdi3MbkMHMFDGJNLxZB60IOhF8jlpd6H5QzBI0KXivqNO5z1m538qWu091cyrRtTczV4WrvIGHlpeLR2lFyqRJp4i0p76XeUctTzVvGWUD76gnlAal+RdkX5ooOEtbtpp7Gj836pnbbmL33exXZpr0P2eZlpX/CYwwX52QpZdpE07djEE6ddLBduPPItF2ndBYuInbjiBaruSNvsznDwKjFc3413W+LHbWfk8oDjQ2ZnbN+5rk5GWo5nco+kXknGC+OeXgWeivvRO9nwK+r+/qJv3FaqlVleWEx861eS/5K4ACK9XlNHr88aUIA1QT1WcPJwosa/6RzqNZb3IWl7+mwIlkVYa+vfU9UAC1jntLmjtbN1CfxrKAqn1yBjjI+RlKr/+WQcZwKgBFzE8sNcppahT3rjWEFR6+A/DYSeliCD2YjrH4T+PYJrrSAYQj+A8bjvOCWTpWk+YNP71tr2x+y+j7+4u8n+4Ff568ZvhtP9xl/2/ws/bP0RWMd//IiJvyN8JR68LG+dI1DhH6m+coYi4sAXLfqeqKXHHvEp5VWPkxvkHVVPj/mmppaj9LTbvuuHc2/p5eOTcdTgD8HQRxb+RniQocm4Y5IPdR2ufa90956j3n/o1z1izH6AXvBsWa/0fo0z9KOWL/SdoyZ1i/1lb7Yczpq70aw7SLzyzn0a48N+oz204E17J/HYwRfe3njmQD9/lXMQW6eMTXPDMDiYTCaTSYM/fQofUk4YJyoAAAAASUVORK5CYII=',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(child: GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              children: [
                StatBox(stat: 'Team', data: '${widget.player.team}'),
                StatBox(stat: 'Games Played', data: '${widget.player.gamesplayed}'),
                StatBox(stat: 'Wins', data: '${widget.player.wins}'),
                StatBox(stat: 'Win Percentage', data: '${widget.winpercent}'),
                StatBox(stat: 'Position', data: 'player data'),
                StatBox(stat: 'Win Percentage', data: 'player data'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
