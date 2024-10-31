import 'package:flutter/material.dart';
import 'package:liam_game/core/extensions/num_extension.dart';
import 'package:liam_game/core/extensions/string_extensions.dart';
import 'package:liam_game/theme/colors.dart';
import 'package:liam_game/widgets/app_image.dart';
import 'package:liam_game/widgets/selected_badge.dart';

final images = [
  'avatar_1.png'.hardcoded,
  'avatar_2.png'.hardcoded,
  'avatar_3.png'.hardcoded,
  'avatar_4.png'.hardcoded,
];

class AvatarCarousel extends StatefulWidget {
  const AvatarCarousel({super.key});

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  final avatarNb = images.length;
  late CarouselController controller;

  int? _selectedIndex;

  @override
  void initState() {
    super.initState();

    controller = CarouselController(initialItem: (avatarNb / 2).floor());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width * 0.33;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        itemExtent: size,
        padding: const EdgeInsets.all(8),
        itemSnapping: true,
        controller: controller,
        onTap: _onAvatarTap,
        overlayColor:
            WidgetStateProperty.all<Color>(WidgetStateColor.transparent),
        children: List.generate(
          avatarNb,
          (index) => Stack(children: [
            AnimatedContainer(
              duration: 200.milliseconds,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == index //
                    ? AppColors.green
                    : AppColors.white,
              ),
              child: AppImage("assets/avatars/${images[index]}".hardcoded),
            ),
            if (_selectedIndex == index)
              const Positioned(
                right: 5,
                top: 5,
                child: SelectedBadge(),
              ),
          ]),
        ),
      ),
    );
  }

  _onAvatarTap(int index) {
    if (index != avatarNb - 1 && index != 0) {
      controller
          .jumpTo((index + 1) * controller.position.maxScrollExtent / avatarNb);
    }
    setState(() {
      _selectedIndex = index;
    });
  }
}
