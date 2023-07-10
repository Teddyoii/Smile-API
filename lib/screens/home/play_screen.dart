import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smile_api_new/gameService.dart';
import 'package:smile_api_new/models/level.dart';
import 'package:smile_api_new/utils/widgets/inputs/app_bar.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Level? level = null;
  bool isButtonVisible = false;
  bool isAnswerfalse = false;
  int answer = 0;

  getLevel() async {
    await getGameLevel().then((value) => {
          setState(() {
            level = value;
          })
        });
  }

  @override
  void initState() {
    getLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Play",
      ),
      body: level == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Level $gameLevel',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.network('${level?.question}'),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    onChanged: ((value) {
                      if (value == "" || value == null) {
                        setState(() {
                          isButtonVisible = false;
                        });
                      } else {
                        setState(() {
                          answer = int.parse(value);
                          isButtonVisible = true;
                        });
                      }
                    }),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Answer',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isButtonVisible
                      ? TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () async {
                            if (answer == level?.solution) {
                              gameLevel++;
                              User user = FirebaseAuth.instance.currentUser!;
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user.uid)
                                  .update({'points': FieldValue.increment(10)});
                              Navigator.pushReplacementNamed(
                                  context, '/correct');
                            } else {
                              setState(() {
                                isAnswerfalse = true;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 14),
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ))
                      : Container(),
                  SizedBox(
                    height: 60,
                  ),
                  isAnswerfalse
                      ? Text("Wrong Answer, Try Again",
                          style: TextStyle(color: Colors.red))
                      : Container()
                ],
              )),
            ),
    );
  }
}
