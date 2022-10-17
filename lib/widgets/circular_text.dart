import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../themes/colors.dart';
import 'scroll_offset_builder.dart';

class CircularText extends StatelessWidget {
  final int radius;
  final String text;
  final TextStyle textStyle;
  final ScrollController scrollController;

  const CircularText({
    required this.scrollController,
    required this.textStyle,
    this.radius = 26,
    // ignore: avoid-non-ascii-symbols
    this.text = '· tsin.is · Roman Cinis',
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScrollOffsetBuilder(
        scrollController: scrollController,
        builder: (_, offset) => CustomPaint(
          painter: _TextPainter(
            radius,
            text,
            textStyle.copyWith(
              color: MyColors.contrastColorLight.withOpacity(
                math.min(offset / 1000, 0.7),
              ),
            ),
            initialAngle: -math.pi / 2 + offset / 500,
          ),
        ),
      );
}

class _TextPainter extends CustomPainter {
  final double initialAngle;
  final num radius;
  final String text;
  final TextStyle textStyle;

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  _TextPainter(this.radius, this.text, this.textStyle, {this.initialAngle = 0});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = radius * 2 * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas
        ..rotate(rotationAngle)
        ..translate(d, 0);
    }

    var angle = initialAngle;
    for (var i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter
      ..text = TextSpan(
        text: letter,
        style: textStyle.copyWith(
          letterSpacing: 1.5,
        ),
      )
      ..layout(maxWidth: double.maxFinite);

    final d = _textPainter.width;
    final alpha = 2 * math.asin(d / (radius * 2));

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(
    double prevAngle,
    double alpha,
  ) =>
      (alpha + prevAngle) / 2;
}
