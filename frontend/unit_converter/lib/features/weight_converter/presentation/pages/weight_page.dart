import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_shell.dart';
import '../../../../core/widgets/converter_form.dart';
import '../controllers/weight_controller.dart';

class WeightPage extends GetView<WeightController> {
  const WeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Weight Converter',
      showBackButton: true,
      child: ConverterForm(
        title: 'Weight Converter',
        subtitle: 'Convert between metric and imperial weight units',
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
