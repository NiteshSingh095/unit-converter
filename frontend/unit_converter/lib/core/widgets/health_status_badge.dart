import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/health/presentation/controllers/health_controller.dart';
import '../constants/app_colors.dart';

class HealthStatusBadge extends StatelessWidget {
  const HealthStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HealthController>();
    return Obx(() {
      final isOnline = controller.isOnline.value;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: (isOnline ? AppColors.success : AppColors.error)
              .withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: (isOnline ? AppColors.success : AppColors.error)
                .withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isOnline ? AppColors.success : AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              isOnline ? 'Online' : 'Offline',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isOnline ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      );
    });
  }
}
