import 'package:flutter/widgets.dart';

import '../../animations/background.dart';
import '../../themes/colors.dart';
import '../../widgets/scroll_offset_builder.dart';
import 'main_text.dart';

class Header extends StatefulWidget {
  final double height;
  final ScrollController scrollController;

  const Header({required this.scrollController, required this.height, Key? key})
      : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _showHeader();
  }

  void _showHeader() => Future.delayed(
        Duration.zero,
        () => setState(() => isVisible = true),
      );

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInCubic,
        opacity: isVisible ? 1 : 0,
        child: ScrollOffsetBuilder(
          scrollController: widget.scrollController,
          builder: (_, offset) => Stack(
            children: <Widget>[
              Positioned(
                top: -0.3 * offset,
                left: 0,
                right: 0,
                height: widget.height,
                child: const AnimatedBackground(),
              ),
              Positioned(
                top: 0.2 * widget.height,
                height: widget.height,
                left: 0,
                right: 0,
                child: MainText(offset),
              ),
              Positioned(
                top: widget.height * 0.95 - offset,
                left: 0,
                right: 0,
                height: widget.height / 3,
                child: Container(
                  height: widget.height / 3,
                  width: double.infinity,
                  color: MyColors.primaryColor,
                ),
              ),
              Positioned(
                top: widget.height * 0.8 - offset,
                left: 0,
                right: 0,
                height: widget.height * 0.2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.8],
                      colors: [
                        MyColors.primaryColor.withOpacity(0),
                        MyColors.primaryColor,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
