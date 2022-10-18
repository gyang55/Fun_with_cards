import 'dart:math';
import 'package:final_exam/drawn_cards_view.dart';
import 'package:final_exam/item_card_view.dart';
import 'package:final_exam/playing_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int seed = 0;
  List<PlayingCard> playing_cards = [
    PlayingCard(id: "2H", value: "2 of Hearts", suit: "Hearts"),
    PlayingCard(id: "JH", value: "Jack of Hearts", suit: "Hearts"),
    PlayingCard(id: "QH", value: "Queen of Hearts", suit: "Hearts"),
    PlayingCard(id: "KH", value: "King of Hearts", suit: "Hearts"),
    PlayingCard(id: "3C", value: "3 of Clubs", suit: "Clubs"),
    PlayingCard(id: "4C", value: "4 of Clubs", suit: "Clubs"),
    PlayingCard(id: "5C", value: "5 of Clubs", suit: "Clubs"),
    PlayingCard(id: "6C", value: "6 of Clubs", suit: "Clubs"),
    PlayingCard(id: "2D", value: "2 of Diamonds", suit: "Diamonds"),
    PlayingCard(id: "6D", value: "6 of Diamonds", suit: "Diamonds"),
    PlayingCard(id: "7D", value: "7 of Diamonds", suit: "Diamonds"),
    PlayingCard(id: "8D", value: "8 of Diamonds", suit: "Diamonds"),
    PlayingCard(id: "9S", value: "9 of Spades", suit: "Spades"),
    PlayingCard(id: "0S", value: "10 of Spades", suit: "Spades"),
    PlayingCard(id: "AS", value: "ACE of Spades", suit: "Spades"),
    PlayingCard(id: "QS", value: "QUEEN of Spades", suit: "Spades"),
  ];
  List<PlayingCard> selectedCards = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Guang Yang: Fun with cards"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: Container(
              height: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Expanded(
                      child: ListView(
                        children: playing_cards
                            .map(
                              (e) => MultipleCards(
                                  playingCard: e,
                                  show: () {
                                    setState(() {
                                      String id = e.id + '.png';
                                      seed = playing_cards.indexOf(e);
                                      selectedCards
                                          .add(playing_cards.elementAt(seed));
                                      // value = e.value;
                                      // baseurl.clear();
                                      // baseurl.add(
                                      //     "https://deckofcardsapi.com/static/img/");
                                      // baseurl.add(id);
                                    });
                                  }),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Container(
                    height: 900,
                    child: DrawCardView(
                        playingCard: playing_cards.elementAt(seed),
                        selectedCards: selectedCards),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Random random = new Random();
                        int seed = random.nextInt(playing_cards.length);
                        this.seed = seed;
                        selectedCards.add(playing_cards.elementAt(seed));
                        // String id = playing_cards.elementAt(seed).id + '.png';
                        // value = playing_cards.elementAt(seed).value;
                        // baseurl.clear();
                        // baseurl.add("https://deckofcardsapi.com/static/img/");
                        // baseurl.add(id);
                      });
                    },
                    child: Text("Draw Card")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCards.clear();
                      });
                    },
                    child: Text("Return all to deck"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
