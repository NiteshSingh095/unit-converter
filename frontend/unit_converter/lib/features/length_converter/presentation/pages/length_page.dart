import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_shell.dart';
import '../../../../core/widgets/converter_form.dart';
import '../controllers/length_controller.dart';

class LengthPage extends GetView<LengthController> {
  const LengthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Length Converter',
      showBackButton: true,
      child: ConverterForm(
        title: 'Length Converter',
        subtitle: 'Convert between metric and imperial length units',
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
