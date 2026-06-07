import '../../../../core/utils/result.dart';
import '../../domain/entities/weight_conversion.dart';
import '../../domain/repositories/weight_repository.dart';
import '../datasources/weight_remote_datasource.dart';
import '../models/weight_request_model.dart';

class WeightRepositoryImpl implements WeightRepository {
  WeightRepositoryImpl(this._dataSource);

  final WeightRemoteDataSource _dataSource;

  @override
  Future<Result<WeightConversion>> convert({
    required double value,
    required String from,
    required String to,
  }) async {
    final request = WeightRequestModel(value: value, from: from, to: to);
    final result = await _dataSource.convert(request);
    return switch (result) {
      Success(:final data) => Success(
          WeightConversion(
            value: value,
            from: from,
            to: to,
            result: data.value,
          ),
        ),
      Error(:final failure) => Error(failure),
    };
  }
}
