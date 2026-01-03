import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/utils/base_layer_transformer.dart';
import 'package:shared/shared.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity extends BaseLayerDataTransformer<List<ProductModel>> {
  ProductEntity({required this.products});

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return _$ProductEntityFromJson(json);
  }

  final List<ProductModel> products;

  @override
  List<ProductModel> get transform => products;
}
