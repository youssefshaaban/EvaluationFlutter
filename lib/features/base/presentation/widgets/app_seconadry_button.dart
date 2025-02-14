import 'package:flutter/material.dart';
import 'package:evaluation/common/extensions/context_extension.dart';

class AppSecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  AppSecondaryButton(
      {required this.title,
      required this.onPressed,
      this.padding,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: context.colorScheme.onTertiary, width: 1),
            ),
            padding: padding),
        onPressed: onPressed,
        child: Text(
          title,
          style: context.textTheme.labelLarge
              ?.copyWith(color: context.colorScheme.onTertiary),
        ),
      ),
    );
  }
}
