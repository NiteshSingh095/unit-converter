import 'package:get/get.dart';

import '../../../../core/utils/result.dart';
import '../../domain/usecases/check_health_usecase.dart';

class HealthController extends GetxController {
  HealthController(this._checkHealthUseCase);

  final CheckHealthUseCase _checkHealthUseCase;

  final RxBool isOnline = false.obs;
  final RxBool isChecking = true.obs;
  final RxString statusMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkHealth();
  }

  Future<void> checkHealth() async {
    isChecking.value = true;
    final result = await _checkHealthUseCase();
    switch (result) {
      case Success(:final data):
        isOnline.value = data.isOnline;
        statusMessage.value = data.message ?? '';
      case Error():
        isOnline.value = false;
        statusMessage.value = '';
    }
    isChecking.value = false;
  }
}
