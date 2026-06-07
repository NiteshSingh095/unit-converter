import '../../../../core/utils/result.dart';
import '../entities/length_conversion.dart';
import '../repositories/length_repository.dart';

class ConvertLengthUseCase {
  ConvertLengthUseCase(this._repository);

  final LengthRepository _repository;

  Future<Result<LengthConversion>> call({
    required double value,
    required String from,
    required String to,
  }) =>
      _repository.convert(value: value, from: from, to: to);
}
