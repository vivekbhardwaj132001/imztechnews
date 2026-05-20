import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color brandColor;
  final double cardRadius;
  final double elevation;

  const AppThemeExtension({
    required this.brandColor,
    required this.cardRadius,
    required this.elevation,
  });

  @override
  AppThemeExtension copyWith({
    Color? brandColor,
    double? cardRadius,
    double? elevation,
  }) {
    return AppThemeExtension(
      brandColor: brandColor ?? this.brandColor,
      cardRadius: cardRadius ?? this.cardRadius,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
    );
  }

  double? lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    return (a ?? 0) + ((b ?? 0) - (a ?? 0)) * t;
  }
}
