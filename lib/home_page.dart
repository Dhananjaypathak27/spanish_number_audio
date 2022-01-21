import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spanish_number_audio/number_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer audioPlayer = AudioPlayer();

  static AudioCache player = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.amber, "one"),
    NumberAudio("two.wav", Colors.red, "two"),
    NumberAudio("three.wav", Colors.blue, "three"),
    NumberAudio("four.wav", Colors.green, "four"),
    NumberAudio("five.wav", Colors.pink, "five"),
    NumberAudio("six.wav", Colors.deepOrange, "six"),
    NumberAudio("seven.wav", Colors.cyan, "seven"),
    NumberAudio("eight.wav", Colors.blueGrey, "eight"),
    NumberAudio("nine.wav", Colors.lightGreen, "nine"),
    NumberAudio("ten.wav", Colors.teal, "ten"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spanish audio"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: numberList.length,
                      itemBuilder: (contex, i) => SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // audioPlayer.pause();
                                // audioPlayer.play("audio/six.wav");
                                playLocal(numberList[i].audioUri!);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      numberList[i].buttonColor)),
                              child: Text("${numberList[i].buttonText}"),
                            ),
                          )))
            ],
          ),
        ),
      ),
    );
  }

  playLocal(String localPath) async {
    player.play(localPath);
  }
}
