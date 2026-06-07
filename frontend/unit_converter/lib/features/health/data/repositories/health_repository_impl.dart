import '../../../../core/utils/result.dart';
import '../../domain/entities/health_status.dart';
import '../../domain/repositories/health_repository.dart';
import '../datasources/health_remote_datasource.dart';

class HealthRepositoryImpl implements HealthRepository {
  HealthRepositoryImpl(this._dataSource);

  final HealthRemoteDataSource _dataSource;

  @override
  Future<Result<HealthStatus>> checkHealth() async {
    final result = await _dataSource.checkHealth();
    return switch (result) {
      Success(:final data) => Success(
          HealthStatus(isOnline: true, message: data.message),
        ),
      Error(:final failure) => Error(failure),
    };
  }
}
