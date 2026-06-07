import 'package:get/get.dart';

import '../../features/about/presentation/pages/about_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/echo/presentation/bindings/echo_binding.dart';
import '../../features/echo/presentation/pages/echo_page.dart';
import '../../features/length_converter/presentation/bindings/length_binding.dart';
import '../../features/length_converter/presentation/pages/length_page.dart';
import '../../features/temperature_converter/presentation/bindings/temperature_binding.dart';
import '../../features/temperature_converter/presentation/pages/temperature_page.dart';
import '../../features/weight_converter/presentation/bindings/weight_binding.dart';
import '../../features/weight_converter/presentation/pages/weight_page.dart';
import 'app_routes.dart';
import 'initial_binding.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.dashboard;

  static final routes = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.length,
      page: () => const LengthPage(),
      binding: LengthBinding(),
    ),
    GetPage(
      name: AppRoutes.weight,
      page: () => const WeightPage(),
      binding: WeightBinding(),
    ),
    GetPage(
      name: AppRoutes.temperature,
      page: () => const TemperaturePage(),
      binding: TemperatureBinding(),
    ),
    GetPage(
      name: AppRoutes.echo,
      page: () => const EchoPage(),
      binding: EchoBinding(),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutPage(),
    ),
  ];
}
