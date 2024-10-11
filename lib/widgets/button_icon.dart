import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({super.key, required this.label, this.imagePath, this.child, this.onClick});

  final String label;
  final String? imagePath;
  final Widget? child;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final content = imagePath != null
        ? Image(image: AssetImage(imagePath!), width: 24, height: 24)
        : child != null
            ? child!
            : const Text("Unknown");

    return ElevatedButton(
      onPressed: onClick,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label),
        const SizedBox(width: 8),
        SizedBox(
          width: 24,
          height: 24,
          child: content,
        ),
      ]),
    );
  }
}
