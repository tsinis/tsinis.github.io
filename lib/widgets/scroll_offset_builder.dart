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
    widget.scrollController.addListener(_offsetListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_offsetListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Builder(builder: _buildWithOffset);

  Widget _buildWithOffset(BuildContext context) =>
      widget.builder(context, _offset);

  void _offsetListener() =>
      setState(() => _offset = widget.scrollController.clientOffset);
}
