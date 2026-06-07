import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/app_pages.dart';
import 'core/routes/initial_binding.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'features/health/presentation/controllers/health_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeController = ThemeController();
  await themeController.init();
  Get.put<ThemeController>(themeController, permanent: true);

  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: 'Unit Converter Pro',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeController.themeMode.value,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        initialBinding: InitialBinding(),
        routingCallback: (routing) {
          if (Get.isRegistered<HealthController>()) {
            final health = Get.find<HealthController>();
            if (!health.isChecking.value && !health.isOnline.value) {
              health.checkHealth();
            }
          }
        },
      ),
    );
  }
}
