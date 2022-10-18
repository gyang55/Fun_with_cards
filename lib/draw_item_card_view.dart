import 'package:final_exam/playing_card.dart';
import 'package:flutter/material.dart';

import 'more_screen.dart';

class DrawItemCard extends StatelessWidget {
  PlayingCard playingCard;

  DrawItemCard({required this.playingCard, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blueAccent,
      height: 200,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Image.network(
                  "https://deckofcardsapi.com/static/img/" +
                      playingCard.id +
                      ".png",
                  height: 100,
                  width: 100,
                )),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => More(
                                  playingCard: this.playingCard,
                                  url: "https://deckofcardsapi.com/static/img/" +
                                      playingCard.id +
                                      ".png")));
                    },
                    child: Text("More"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    this.playingCard.value,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
