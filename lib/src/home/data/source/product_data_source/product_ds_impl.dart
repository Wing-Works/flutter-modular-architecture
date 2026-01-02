
import 'package:flutter_modular_architecture/src/home/data/source/product_data_source/product_ds.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

@Injectable(as: ProductDataSource)
class ArticleDataSourceImpl implements ProductDataSource {
  ArticleDataSourceImpl(this._retrofitService);

  final NetworkClient _retrofitService;

  @override
  Future<ProductEntity> getProductList(Map<String, dynamic> queries) {
    return _retrofitService.getProductList(queries);
  }

}
