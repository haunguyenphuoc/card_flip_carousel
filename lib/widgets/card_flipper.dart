import 'dart:ui';
import 'package:card_flip_carousel/models/image_model.dart';
import 'package:card_flip_carousel/widgets/card.dart';
import 'package:flutter/material.dart';

class CardFlipper extends StatefulWidget {
  final List<ImageModel> images;
  Function(double scrollPercent) onScroll;
  CardFlipper({this.images, this.onScroll});
  @override
  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper>
    with SingleTickerProviderStateMixin {
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishController;

  @override
  void initState() {
    finishController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        setState(() {
          scrollPercent = lerpDouble(
              finishScrollStart, finishScrollEnd, finishController.value);
        });
        if (widget.onScroll != null) {
          widget.onScroll(scrollPercent);
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    finishController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final currDistance = currDrag.dx - startDrag.dx;
    final singleCardDragPecent = currDistance / context.size.width;
    final numCards = widget.images.length;
    setState(() {
      scrollPercent =
          (startDragPercentScroll + (-singleCardDragPecent / numCards))
              .clamp(0.0, 1.0 - (1.0 / numCards));
      if (widget.onScroll != null) {
        widget.onScroll(scrollPercent);
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = widget.images.length;

    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * numCards).round() / numCards;
    finishController.forward(from: 0.0);
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildCards() {
    final cardCount = widget.images.length;
    int index = -1;
    return widget.images.map((ImageModel model) {
      index++;
      return _buildCard(index, cardCount, scrollPercent, model);
    }).toList();
  }

  Widget _buildCard(
      int cardIndex, int cardCount, double scrollPercent, ImageModel model) {
    final cardScrollPercent = scrollPercent * cardCount;
    final parallax = scrollPercent - cardIndex / cardCount;
    return FractionalTranslation(
      translation: Offset((cardIndex - cardScrollPercent), 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardImage(
          imageModel: model,
          parallaxPercent: parallax,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        children: _buildCards(),
      ),
    );
  }
}
