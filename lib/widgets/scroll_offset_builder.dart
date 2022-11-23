import 'package:flutter/widgets.dart';

import '../extensions/scroll_extensions.dart';

class ScrollOffsetBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, double offset) builder;
  final ScrollController scrollController;

  const ScrollOffsetBuilder({
    required this.scrollController,
    required this.builder,
    super.key,
  });

  @override
  State<ScrollOffsetBuilder> createState() => _ScrollOffsetBuilderState();
}

class _ScrollOffsetBuilderState extends State<ScrollOffsetBuilder> {
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(offsetListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(offsetListener);
    super.dispose();
  }

  Widget buildWithOffset(BuildContext context) =>
      widget.builder(context, _offset);

  void offsetListener() =>
      setState(() => _offset = widget.scrollController.clientOffset);

  @override
  Widget build(BuildContext context) => Builder(builder: buildWithOffset);
}
