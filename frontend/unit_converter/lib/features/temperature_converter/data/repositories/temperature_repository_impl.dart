import '../../../../core/utils/result.dart';
import '../../domain/entities/temperature_conversion.dart';
import '../../domain/repositories/temperature_repository.dart';
import '../datasources/temperature_remote_datasource.dart';
import '../models/temperature_request_model.dart';

class TemperatureRepositoryImpl implements TemperatureRepository {
  TemperatureRepositoryImpl(this._dataSource);

  final TemperatureRemoteDataSource _dataSource;

  @override
  Future<Result<TemperatureConversion>> convert({
    required double value,
    required String from,
    required String to,
  }) async {
    final request = TemperatureRequestModel(value: value, from: from, to: to);
    final result = await _dataSource.convert(request);
    return switch (result) {
      Success(:final data) => Success(
          TemperatureConversion(
            value: value,
            from: from,
            to: to,
            result: data.result,
          ),
        ),
      Error(:final failure) => Error(failure),
    };
  }
}
