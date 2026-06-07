import '../../../../core/utils/result.dart';
import '../entities/echo_result.dart';

abstract class EchoRepository {
  Future<Result<EchoResult>> sendEcho(String name);
}
