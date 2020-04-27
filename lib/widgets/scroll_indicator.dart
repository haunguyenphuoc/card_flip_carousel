import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;
  ScrollIndicator({
    this.cardCount,
    this.scrollPercent,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(
          cardCount: cardCount, scrollPercent: scrollPercent),
      child: Container(),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  final int cardCount;
  final double scrollPercent;
  final Paint trackPaint;
  final Paint thumbPaint;
  ScrollIndicatorPainter({
    this.cardCount,
    this.scrollPercent,
  })  : trackPaint = new Paint()
          ..color = const Color(0xFF444444)
          ..style = PaintingStyle.fill,
        thumbPaint = new Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw track
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            0.0,
            0.0,
            size.width,
            size.height,
          ),
          topLeft: Radius.circular(3.0),
          topRight: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
          bottomRight: Radius.circular(3.0),
        ),
        trackPaint);

    // Draw thumb
    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(
            thumbLeft,
            0.0,
            thumbWidth,
            size.height,
          ),
          topLeft: Radius.circular(3.0),
          topRight: Radius.circular(3.0),
          bottomLeft: Radius.circular(3.0),
          bottomRight: Radius.circular(3.0),
        ),
        thumbPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
