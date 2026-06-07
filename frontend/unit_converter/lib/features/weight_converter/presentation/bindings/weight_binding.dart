import 'package:get/get.dart';

import '../../data/datasources/weight_remote_datasource.dart';
import '../../data/repositories/weight_repository_impl.dart';
import '../../domain/repositories/weight_repository.dart';
import '../../domain/usecases/convert_weight_usecase.dart';
import '../controllers/weight_controller.dart';

class WeightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeightRemoteDataSource>(
      () => WeightRemoteDataSource(Get.find()),
      fenix: true,
    );
    Get.lazyPut<WeightRepository>(
      () => WeightRepositoryImpl(Get.find<WeightRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ConvertWeightUseCase>(
      () => ConvertWeightUseCase(Get.find<WeightRepository>()),
      fenix: true,
    );
    Get.lazyPut<WeightController>(
      () => WeightController(Get.find<ConvertWeightUseCase>()),
    );
  }
}
