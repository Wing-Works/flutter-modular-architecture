

import 'package:flutter_modular_architecture/src/home/domain/product_list/product_model.dart';
import 'package:shared/models/network_error.dart';
import 'package:shared/shared.dart';

abstract class ProductRepository {
  Future<Either<NetworkError, List<ProductModel>>> getArticles(
    Map<String, dynamic> queries,
  );
}
