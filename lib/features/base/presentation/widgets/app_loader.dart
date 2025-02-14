import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.3),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
