import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/health/data/datasources/health_remote_datasource.dart';
import '../../features/health/data/repositories/health_repository_impl.dart';
import '../../features/health/domain/repositories/health_repository.dart';
import '../../features/health/domain/usecases/check_health_usecase.dart';
import '../../features/health/presentation/controllers/health_controller.dart';
import '../network/api_client.dart';
import '../network/dio_factory.dart';
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(DioFactory.create, fenix: true);
    Get.lazyPut<ApiClient>(() => ApiClient(Get.find<Dio>()), fenix: true);

    Get.lazyPut<HealthRemoteDataSource>(
      () => HealthRemoteDataSource(Get.find<ApiClient>()),
      fenix: true,
    );
    Get.lazyPut<HealthRepository>(
      () => HealthRepositoryImpl(Get.find<HealthRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<CheckHealthUseCase>(
      () => CheckHealthUseCase(Get.find<HealthRepository>()),
      fenix: true,
    );
    Get.lazyPut<HealthController>(
      () => HealthController(Get.find<CheckHealthUseCase>()),
      fenix: true,
    );
  }
}
