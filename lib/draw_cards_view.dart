import 'package:final_exam/draw_item_card_view.dart';
import 'package:final_exam/playing_card.dart';
import 'package:flutter/material.dart';

class DrawCardView extends StatefulWidget {
  List<PlayingCard> selectedCards;
  PlayingCard playingCard;

  DrawCardView(
      {Key? key, required this.selectedCards, required this.playingCard})
      : super(key: key);

  @override
  State<DrawCardView> createState() => DrawCardState(
      playingCard: playingCard, selectedCards: selectedCards);
}

class DrawCardState extends State<DrawCardView> {
  List<PlayingCard> selectedCards;
  PlayingCard playingCard;

  DrawCardState({required this.selectedCards, required this.playingCard});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      color: Colors.blueAccent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blueAccent,
                child: Text(
                  "Draw cards",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${selectedCards.length} of ${playingCard.suit}",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                children: selectedCards
                    .map((e) => DrawItemCard(
                          playingCard: e,
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
