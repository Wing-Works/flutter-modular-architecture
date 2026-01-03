import 'package:flutter_modular_architecture/src/home/data/source/product_data_source/product_ds.dart';
import 'package:flutter_modular_architecture/src/home/domain/product_repository/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:shared/models/network_error.dart';
import 'package:shared/shared.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.articleDataSource});

  final ProductDataSource articleDataSource;

  @override
  Future<Either<NetworkError, List<ProductModel>>> getArticles(
    Map<String, dynamic> queries,
  ) {
    return safeApiCall<List<ProductModel>>(
      () => articleDataSource.getProductList(queries),
    );
  }
}
