import 'package:shared/models/base_error.dart';
import 'package:shared/usecase/base/params.dart';
import 'package:shared/utils/either.dart';

abstract class BaseUseCase<P extends Params, T> {
  Future<Either<BaseError, T>> execute(P params);
}

abstract class UseCaseExecutor<T> {
  Future<Either<BaseError, T>> execute();
}
