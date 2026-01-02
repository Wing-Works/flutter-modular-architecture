import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_modular_architecture/core/base/bloc/state/base_state.dart';
import 'package:flutter_modular_architecture/src/home/domain/get_product_list/get_product_list_usecase.dart';
import 'package:flutter_modular_architecture/src/home/domain/product_list/product_model.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BlocBase<HomeEvent, HomeState> {
  HomeBloc(this._getArticleUseCase) : super(const HomeState());

  final GetProductListUseCase _getArticleUseCase;

  @override
  void init() => fetchData();

  @override
  void mapEventToState() {
    on<GetArticlesEvent>((event, emit) {
      emit(state.copyWith(list: event.list));
    });
  }

  final TextEditingController controller = .new();

  void fetchData() {
    apiCall<List<ProductModel>>(
      _getArticleUseCase,
      params: GetArticleParams(limit: 10),
      onSuccess: (data) => add(GetArticlesEvent(data)),
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
