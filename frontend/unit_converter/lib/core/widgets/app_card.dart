import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.glassmorphism = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool glassmorphism;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (glassmorphism) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: (isDark ? AppColors.darkCard : AppColors.card)
                  .withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: (isDark ? AppColors.darkBorder : AppColors.border)
                    .withValues(alpha: 0.5),
              ),
            ),
            child: child,
          ),
        ),
      );
    }

    return Card(child: Padding(padding: padding, child: child));
  }
}
