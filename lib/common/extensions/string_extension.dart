import 'package:flutter/material.dart';

extension StringExtension on String {
  bool get isEgyptPhoneNumber {
    final regex = RegExp(r'^01[0-9]{9}$');
    return regex.hasMatch(this);
  }

  Color get hexToColor {
    try {
      if (this.startsWith('#')) {
        String code = this.substring(1);
        final int val = int.parse(code, radix: 16);
        return Color(val + 0xFF000000);
      }
      return Colors.black;
    } catch (e) {
      print('Invalid hex color string: $this'); // Log or handle error
      return Colors.black; // Optional default color
    }
  }
}

extension ColorExtension on String {
  Color toColor() {
    switch (this.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
      default:
        return Colors.transparent; // Default color if no match is found
    }
  }
}
