
import 'package:network/network.dart';

abstract class ProductDataSource {
  Future<ProductEntity> getProductList(Map<String, dynamic> queries);
}
