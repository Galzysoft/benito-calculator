import 'package:baniito_calculator/utils/src/app_theme.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static const TextStyle btnStyle = TextStyle(
      color: AppTheme.btnTextWhite, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle screenStyle = TextStyle(
      color: AppTheme.btnTextWhite, fontSize: 40, fontWeight: FontWeight.bold);
}

class AppDecorations {
  static const BoxDecoration rouded = BoxDecoration(
      color: AppTheme.btnTextWhite,
      borderRadius: BorderRadius.all(Radius.circular(20)));
  static final BoxDecoration outline =
      BoxDecoration(border: Border.all(color: AppTheme.btnRed));
}
