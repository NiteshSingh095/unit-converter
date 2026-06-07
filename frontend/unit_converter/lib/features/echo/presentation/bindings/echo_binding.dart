import 'package:get/get.dart';

import '../../data/datasources/echo_remote_datasource.dart';
import '../../data/repositories/echo_repository_impl.dart';
import '../../domain/repositories/echo_repository.dart';
import '../../domain/usecases/send_echo_usecase.dart';
import '../controllers/echo_controller.dart';

class EchoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EchoRemoteDataSource>(
      () => EchoRemoteDataSource(Get.find()),
      fenix: true,
    );
    Get.lazyPut<EchoRepository>(
      () => EchoRepositoryImpl(Get.find<EchoRemoteDataSource>()),
      fenix: true,
    );
    Get.lazyPut<SendEchoUseCase>(
      () => SendEchoUseCase(Get.find<EchoRepository>()),
      fenix: true,
    );
    Get.lazyPut<EchoController>(
      () => EchoController(Get.find<SendEchoUseCase>()),
    );
  }
}
