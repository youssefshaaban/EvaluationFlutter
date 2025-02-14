import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final EdgeInsetsDirectional margin;

  const AppLogo(
      {super.key,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.margin = EdgeInsetsDirectional.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0), child: Icon(Icons.abc)));
  }
}
