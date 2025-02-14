import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/extensions/context_extension.dart';
import '../../../../gen/assets.gen.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldLabel;
  final String? error;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final Color? textColor;
  final int? minLines;
  final bool enabled;
  final bool needRightPadding;
  final Color? fillColor;
  final bool? readyOnly;
  final AssetGenImage? suffixIcon;
  final Function()? onSuffixIconPressed;

  const AppTextField({
    super.key,
    required this.controller,
    required this.fieldLabel,
    this.error,
    this.onChange,
    this.onSubmitted,
    this.obscureText = false,
    this.textInputType,
    this.inputFormatters,
    this.maxLines = 1,
    this.textColor,
    this.needRightPadding = false,
    this.fillColor,
    this.minLines,
    this.enabled = true,
    this.readyOnly = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      readOnly: widget.readyOnly ?? false,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.textInputType,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmitted,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: context.textTheme.bodyLarge?.copyWith(
        color: widget.textColor ?? context.colorScheme.onSurfaceVariant,
      ),
      decoration: InputDecoration(
        labelText: widget.fieldLabel,
        labelStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.outlineVariant,
        ),
        filled: true,
        fillColor: widget.fillColor ?? Color(0xFFf7f7f7),
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: widget.onSuffixIconPressed,
                child: Container(
                  height: 40,
                  width: 40,
                  margin: widget.needRightPadding
                      ? EdgeInsets.symmetric(vertical: 5, horizontal: 10)
                      : const EdgeInsets.only(left: 10),
                  child: Image.asset(widget.suffixIcon!.path),
                ),
              )
            : null,
        enabled: widget.enabled,
        errorText: widget.error,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0, // Adjust padding for height
          horizontal: 16.0, // Adjust padding for width
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
