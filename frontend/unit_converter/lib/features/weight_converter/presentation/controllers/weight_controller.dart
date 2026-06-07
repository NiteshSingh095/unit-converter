import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/unit_lists.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/weight_conversion.dart';
import '../../domain/usecases/convert_weight_usecase.dart';

class WeightController extends GetxController {
  WeightController(this._convertWeightUseCase);

  final ConvertWeightUseCase _convertWeightUseCase;

  final valueController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final units = UnitLists.weightUnits;
  final fromUnit = 'kg'.obs;
  final toUnit = 'lb'.obs;
  final isLoading = false.obs;
  final errorMessage = RxnString();
  final conversion = Rxn<WeightConversion>();
  final resultText = RxnString();

  Future<void> convert() async {
    errorMessage.value = null;
    conversion.value = null;
    resultText.value = null;

    if (!(formKey.currentState?.validate() ?? false)) return;

    final unitError = Validators.validateDifferentUnits(
      fromUnit.value,
      toUnit.value,
    );
    if (unitError != null) {
      errorMessage.value = unitError;
      return;
    }

    isLoading.value = true;
    final value = double.parse(valueController.text.trim());
    final result = await _convertWeightUseCase(
      value: value,
      from: fromUnit.value,
      to: toUnit.value,
    );

    switch (result) {
      case Success(:final data):
        conversion.value = data;
        resultText.value = '${data.result} ${toUnit.value}';
      case Error(:final failure):
        errorMessage.value = failure.message;
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    valueController.dispose();
    super.onClose();
  }
}
