import '../../../../core/utils/result.dart';
import '../../domain/entities/length_conversion.dart';
import '../../domain/repositories/length_repository.dart';
import '../datasources/length_remote_datasource.dart';
import '../models/length_request_model.dart';

class LengthRepositoryImpl implements LengthRepository {
  LengthRepositoryImpl(this._dataSource);

  final LengthRemoteDataSource _dataSource;

  @override
  Future<Result<LengthConversion>> convert({
    required double value,
    required String from,
    required String to,
  }) async {
    final request = LengthRequestModel(value: value, from: from, to: to);
    final result = await _dataSource.convert(request);
    return switch (result) {
      Success(:final data) => Success(
          LengthConversion(
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
