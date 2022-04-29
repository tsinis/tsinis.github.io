import 'dart:math';

import 'package:flutter/widgets.dart';

import '../themes/colors.dart';

class _PulseAnimation extends CustomPainter {
  final Animation<double> animation;

  _PulseAnimation(this.animation) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    final opacity = (1 - (value / 3)).clamp(0, 1).toDouble();
    final color = MyColors.primaryColorDark.withOpacity(opacity);

    final size = rect.width * 4;
    final area = size * size;
    final radius = sqrt(area * value * 4);

    final paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    for (var wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(_PulseAnimation oldDelegate) => true;
}

class Brno extends StatefulWidget {
  const Brno({Key? key}) : super(key: key);

  @override
  State<Brno> createState() => _BrnoState();
}

class _BrnoState extends State<Brno> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    startAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() => controller
    ..stop()
    ..reset()
    ..repeat(period: const Duration(seconds: 3));

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _PulseAnimation(controller),
        child: const SizedBox(width: 4.2),
      );
}
