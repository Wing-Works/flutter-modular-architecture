import 'package:shared/models/network_error.dart';
import 'package:shared/shared.dart';

abstract class ProductRepository {
  Future<Either<NetworkError, List<ProductModel>>> getArticles(
    Map<String, dynamic> queries,
  );
}
