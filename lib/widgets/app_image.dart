import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(this.asset, {super.key});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: BoxFit.fill,
    );
  }
}
