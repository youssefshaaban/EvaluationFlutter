import 'package:flutter/material.dart';
import 'package:evaluation/common/constants/dimens.dart';
import 'package:evaluation/common/extensions/double_extension.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final IconData? icon;
  final ButtonStyle? style;
  final void Function()? onPressed;
  final bool isBtnLoading;
  final bool columnChildren;

  const AppPrimaryButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.icon,
    this.style,
    this.onPressed,
    this.columnChildren = false,
    this.isBtnLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? (Dimens.buttonHeight).toResponsiveHeight,
      child: TextButton(
        style: style,
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: columnChildren
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                    ],
                    isBtnLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(title),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                    ],
                    isBtnLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(title),
                  ],
                ),
        ),
      ),
    );
  }
}
