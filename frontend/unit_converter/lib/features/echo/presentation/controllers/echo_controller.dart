import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/echo_result.dart';
import '../../domain/usecases/send_echo_usecase.dart';

class EchoController extends GetxController {
  EchoController(this._sendEchoUseCase);

  final SendEchoUseCase _sendEchoUseCase;

  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final errorMessage = RxnString();
  final echoResult = Rxn<EchoResult>();

  Future<void> sendEcho() async {
    errorMessage.value = null;
    echoResult.value = null;

    if (!(formKey.currentState?.validate() ?? false)) return;

    isLoading.value = true;
    final result = await _sendEchoUseCase(textController.text.trim());

    switch (result) {
      case Success(:final data):
        echoResult.value = data;
      case Error(:final failure):
        errorMessage.value = failure.message;
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
