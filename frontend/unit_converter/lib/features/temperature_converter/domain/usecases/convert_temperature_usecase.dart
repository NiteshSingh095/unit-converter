import '../../../../core/utils/result.dart';
import '../entities/temperature_conversion.dart';
import '../repositories/temperature_repository.dart';

class ConvertTemperatureUseCase {
  ConvertTemperatureUseCase(this._repository);

  final TemperatureRepository _repository;

  Future<Result<TemperatureConversion>> call({
    required double value,
    required String from,
    required String to,
  }) =>
      _repository.convert(value: value, from: from, to: to);
}
