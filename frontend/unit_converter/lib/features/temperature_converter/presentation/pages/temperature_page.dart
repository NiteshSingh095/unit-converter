import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_shell.dart';
import '../../../../core/widgets/converter_form.dart';
import '../controllers/temperature_controller.dart';

class TemperaturePage extends GetView<TemperatureController> {
  const TemperaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Temperature Converter',
      showBackButton: true,
      child: ConverterForm(
        title: 'Temperature Converter',
        subtitle: 'Convert between Celsius, Fahrenheit, and Kelvin',
        formKey: controller.formKey,
        valueController: controller.valueController,
        units: controller.units,
        fromUnit: controller.fromUnit,
        toUnit: controller.toUnit,
        isLoading: controller.isLoading,
        errorMessage: controller.errorMessage,
        resultText: controller.resultText,
        onConvert: controller.convert,
        onFromChanged: (v) {
          if (v != null) controller.fromUnit.value = v;
        },
        onToChanged: (v) {
          if (v != null) controller.toUnit.value = v;
        },
      ),
    );
  }
}
