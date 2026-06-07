import '../../../../core/utils/result.dart';
import '../entities/weight_conversion.dart';
import '../repositories/weight_repository.dart';

class ConvertWeightUseCase {
  ConvertWeightUseCase(this._repository);

  final WeightRepository _repository;

  Future<Result<WeightConversion>> call({
    required double value,
    required String from,
    required String to,
  }) =>
      _repository.convert(value: value, from: from, to: to);
}
