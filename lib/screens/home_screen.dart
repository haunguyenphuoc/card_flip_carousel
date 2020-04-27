import 'package:card_flip_carousel/models/image_model.dart';
import 'package:card_flip_carousel/widgets/bottom_bar.dart';
import 'package:card_flip_carousel/widgets/card_flipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double scrollPercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // top bar
          Container(
            width: double.infinity,
            height: 20.0,
          ),
          // Cards
          Expanded(
            child: Container(
              child: CardFlipper(
                  images: listImage,
                  onScroll: (double scrollPercent) {
                    setState(() {
                      this.scrollPercent = scrollPercent;
                    });
                  }),
            ),
          ),
          // bottom bar
          BottomBar(
            cardCount: listImage.length,
            scrollPercent: scrollPercent,
          ),
        ],
      ),
    );
  }
}
