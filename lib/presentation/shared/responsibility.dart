import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveExtensions on BuildContext {
  bool get isMobile => ResponsiveBreakpoints.of(this).smallerThan(MOBILE);
  bool get isTablet => ResponsiveBreakpoints.of(this).largerThan(TABLET);
  bool isBetweenMobileAndTablet() => ResponsiveBreakpoints.of(this).between(MOBILE, TABLET);
}
