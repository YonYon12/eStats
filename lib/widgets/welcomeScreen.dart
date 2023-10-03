import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projectesports/classes/team.dart';
import 'package:projectesports/testingthings/testingAPI.dart';
import 'package:projectesports/widgets/gameScreen.dart';

class welcome extends StatefulWidget {
  welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  late Future myFuture;
  List<Team> tList = List.of(<Team>[]);

  Future<String> getData() async {
    tList = await populateTeams();
    print('Finished call');
    return 'finished';

  }
  @override
  void initState() {
    // assign this variable your Future
    myFuture = getData();
    super.initState();
  }

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
        body: Center(
          child: FutureBuilder(
            future: myFuture,
            builder: (context, snapshot){
              if(snapshot.data == null)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 150,
                      child: Card(
                        elevation: 10,

                        color: Colors.black,
                        child: Container(
                          child: Center(
                            child: Text(
                              'WELCOME TO ESTATS\n\n      LOADING DATA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('Loading Complete You May Now Continue:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text('Games',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black
                          ),),

                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GamePage(tList: tList)),
                          );
                        })
                  ],
                );
              }
            },
          )
        ),
      );
  }
}
