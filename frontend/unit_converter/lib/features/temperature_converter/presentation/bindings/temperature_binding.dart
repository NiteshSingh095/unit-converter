import 'package:get/get.dart';

import '../../data/datasources/temperature_remote_datasource.dart';
import '../../data/repositories/temperature_repository_impl.dart';
import '../../domain/repositories/temperature_repository.dart';
import '../../domain/usecases/convert_temperature_usecase.dart';
import '../controllers/temperature_controller.dart';

class TemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemperatureRemoteDataSource>(
      () => TemperatureRemoteDataSource(Get.find()),
      fenix: true,
    );
    Get.lazyPut<TemperatureRepository>(
      () => TemperatureRepositoryImpl(Get.find<TemperatureRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ConvertTemperatureUseCase>(
      () => ConvertTemperatureUseCase(Get.find<TemperatureRepository>()),
      fenix: true,
    );
    Get.lazyPut<TemperatureController>(
      () => TemperatureController(Get.find<ConvertTemperatureUseCase>()),
    );
  }
}
