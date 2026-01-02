import 'package:shared/models/network_error.dart';
import 'package:shared/usecase/base/base_usecase.dart';
import 'package:shared/usecase/base/params.dart';
import 'package:shared/utils/either.dart';

typedef ApiResult<T> = Future<Either<NetworkError, T>>;

typedef BaseCheck<P extends Params, T> = BaseUseCase<P, T>;

typedef DataMap = Map<String, dynamic>;

typedef StringMap = Map<String, String>;
