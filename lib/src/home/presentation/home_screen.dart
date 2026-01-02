import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/base_widget/stateless/base_stateless_widget.dart';
import 'package:flutter_modular_architecture/src/home/domain/product_list/product_model.dart';
import 'package:flutter_modular_architecture/src/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_modular_architecture/src/home/presentation/widgets/item_card_widget.dart';

class HomeScreen extends BaseStatelessWidget<HomeBloc> {
  const HomeScreen(super.bloc, {super.key});

  static const String routeName = '/home';

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, HomeBloc bloc) {
    return AppBar(
      title: const Text('Home Screen', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
      actions: const [Icon(Icons.refresh, color: Colors.white)],
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Widget buildView(BuildContext context, HomeBloc model) {
    return BlocSelector<HomeBloc, HomeState, List<ProductModel>>(
      selector: (s) => s.list,
      builder: (_, list) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, index) => ItemCard(list[index]),
            separatorBuilder: (_, _) => const SizedBox(height: 12),
          ),
        );
      },
    );
  }
}
