import '../../../../core/utils/result.dart';
import '../entities/echo_result.dart';
import '../repositories/echo_repository.dart';

class SendEchoUseCase {
  SendEchoUseCase(this._repository);

  final EchoRepository _repository;

  Future<Result<EchoResult>> call(String name) => _repository.sendEcho(name);
}
