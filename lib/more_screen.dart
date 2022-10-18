import 'package:final_exam/playing_card.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  PlayingCard playingCard;
  String url;

  More({Key? key, required this.playingCard, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      body: ListView(
        children: [
          Image.network(url),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back")),
              ),
            ],
          )
        ],
      ),
    );
  }
}
