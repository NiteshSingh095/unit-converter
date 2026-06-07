import '../../../../core/utils/result.dart';
import '../entities/length_conversion.dart';

abstract class LengthRepository {
  Future<Result<LengthConversion>> convert({
    required double value,
    required String from,
    required String to,
  });
}
