import 'dart:ui';

import 'package:card_flip_carousel/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Flip Carousel',
      home: HomeScreen(),
    );
  }
}
