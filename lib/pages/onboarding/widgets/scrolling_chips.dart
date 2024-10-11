import 'package:flutter/material.dart';
import 'package:liam_game/pages/onboarding/widgets/text_chip.dart';

class ScrollingChips extends StatefulWidget {
  const ScrollingChips({super.key, required this.labels, this.reversed = false});

  final List<String> labels;
  final bool reversed;

  @override
  State<ScrollingChips> createState() => _ScrollingChipsState();
}

class _ScrollingChipsState extends State<ScrollingChips> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        double minScrollExtent = _scrollController.position.minScrollExtent;
        double maxScrollExtent = _scrollController.position.maxScrollExtent;

        if (widget.reversed) _scrollController.jumpTo(maxScrollExtent);

        _animateTo(
          widget.reversed ? maxScrollExtent : minScrollExtent,
          widget.reversed ? minScrollExtent : maxScrollExtent,
          10,
          _scrollController,
        );
    });
  }

  _animateTo(double start, double end, int seconds, ScrollController scrollController) {
    if(scrollController.hasClients) { // To avoid error : Unhandled Exception: 'package:flutter/src/widgets/scroll_controller.dart': Failed assertion: line 201 pos 12: '_positions.isNotEmpty': ScrollController not attached to any scroll views.
      scrollController
          .animateTo(
        end,
        duration: Duration(seconds: seconds),
        curve: Curves.linear,
      )
          .then((_) {
        _animateTo(end, start, seconds, scrollController);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.labels.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => TextChip(
          label: widget.labels[index],
        ),
      ),
    );
  }
}
