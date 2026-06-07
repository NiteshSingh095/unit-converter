import '../../../../core/utils/result.dart';
import '../entities/health_status.dart';

abstract class HealthRepository {
  Future<Result<HealthStatus>> checkHealth();
}
