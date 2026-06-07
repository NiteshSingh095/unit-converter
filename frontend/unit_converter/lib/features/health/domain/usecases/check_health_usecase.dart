import '../../../../core/utils/result.dart';
import '../entities/health_status.dart';
import '../repositories/health_repository.dart';

class CheckHealthUseCase {
  CheckHealthUseCase(this._repository);

  final HealthRepository _repository;

  Future<Result<HealthStatus>> call() => _repository.checkHealth();
}
