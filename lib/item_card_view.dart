import 'package:final_exam/playing_card.dart';
import 'package:flutter/material.dart';

class MultipleCards extends StatelessWidget {
  PlayingCard playingCard;
  Function() show;

  MultipleCards({required this.playingCard, required this.show, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Color(0xFF01579B),
      child: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: TextButton(
            onPressed: show,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${playingCard.value}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
