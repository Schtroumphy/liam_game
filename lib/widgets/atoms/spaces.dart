import 'package:flutter/cupertino.dart';

class Space extends StatelessWidget {
  const Space(this.size, {Key? key, this.type = SpaceType.vertical})
      : super(key: key);

  final SpaceType type;
  final double size;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      SpaceType.horizontal => SizedBox(width: size),
      SpaceType.vertical => SizedBox(height: size)
    };
  }
}

enum SpaceType { horizontal, vertical }
