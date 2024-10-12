import 'package:flutter/material.dart';
import 'package:liam_game/widgets/app_flex.dart';

extension IntExtension on int {
  Widget get flex => AppFlex(this);
}

