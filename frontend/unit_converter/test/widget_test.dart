import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:unit_converter/core/theme/theme_controller.dart';
import 'package:unit_converter/main.dart';

void main() {
  testWidgets('App renders Unit Converter Pro title', (tester) async {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    await tester.pumpWidget(const UnitConverterApp());
    await tester.pumpAndSettle();

    expect(find.text('Unit Converter Pro'), findsWidgets);
  });
}
