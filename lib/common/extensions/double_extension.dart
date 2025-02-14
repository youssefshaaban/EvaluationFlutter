import 'package:responsive_sizer/responsive_sizer.dart';

extension ResponsiveDimensions on double {
  double get toResponsiveHeight {
    return ((this / 812) * 100).h;
  }

  double get toResponsiveWidth {
    return ((this / 375) * 100).w;
  }
}

extension ResponsiveDimension on int {
  double get toResponsiveHeight {
    return ((this / 812) * 100).h;
  }

  double get toResponsiveWidth {
    return ((this / 375) * 100).w;
  }
}
