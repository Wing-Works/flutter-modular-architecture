import 'package:flutter_modular_architecture/src/home/domain/product_repository/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/models/network_error.dart';
import 'package:shared/shared.dart';

@injectable
class GetProductListUseCase
    extends BaseUseCase<GetArticleParams, List<ProductModel>> {
  GetProductListUseCase(this._articleRepository);

  final ProductRepository _articleRepository;

  @override
  Future<Either<NetworkError, List<ProductModel>>> execute(
    GetArticleParams params,
  ) {
    return _articleRepository.getArticles(params.toJson);
  }
}

class GetArticleParams extends Params {
  GetArticleParams({required this.limit});

  final int limit;

  @override
  Map<String, dynamic> get toJson => {'limit': limit};
}
