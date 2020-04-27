import 'package:card_flip_carousel/models/image_model.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final ImageModel imageModel;
  final double parallaxPercent;
  CardImage({this.imageModel, this.parallaxPercent = 0.0});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: FractionalTranslation(
            translation: Offset(parallaxPercent * 2, 0),
            child: Image.asset(
              imageModel.imagePath ?? 'assets/pokemon1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                '12:34 AM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Monday, Nov 29',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              'RnD1 City',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '34°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 2.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 40.0, left: 30.0, right: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Mostly Cloud',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                      Text(
                        '112mph ENE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
