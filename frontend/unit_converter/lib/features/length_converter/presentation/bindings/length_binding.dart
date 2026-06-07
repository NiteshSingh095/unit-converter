import 'package:get/get.dart';

import '../../data/datasources/length_remote_datasource.dart';
import '../../data/repositories/length_repository_impl.dart';
import '../../domain/repositories/length_repository.dart';
import '../../domain/usecases/convert_length_usecase.dart';
import '../controllers/length_controller.dart';

class LengthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LengthRemoteDataSource>(
      () => LengthRemoteDataSource(Get.find()),
      fenix: true,
    );
    Get.lazyPut<LengthRepository>(
      () => LengthRepositoryImpl(Get.find<LengthRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<ConvertLengthUseCase>(
      () => ConvertLengthUseCase(Get.find<LengthRepository>()),
      fenix: true,
    );
    Get.lazyPut<LengthController>(
      () => LengthController(Get.find<ConvertLengthUseCase>()),
    );
  }
}
