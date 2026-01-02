import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular_architecture/core/base/bloc/base_state.dart';

mixin ScaffoldWrapper<B extends BlocBase<BaseState>> {
  @mustCallSuper
  @protected
  Widget buildView(BuildContext context);

  PreferredSizeWidget? buildAppbar(BuildContext context) => null;

  Key? get scaffoldKey => null;

  Color? get backgroundColor => null;

  Widget? drawer(BuildContext context) => null;

  void onDrawerChanged(bool isOpened) {}

  Widget? endDrawer(BuildContext context) => null;

  void onEndDrawerChanged(bool isOpened) {}

  bool get extendBody => false;

  bool get extendBodyBehindAppBar => false;

  Widget? bottomNavigationBar(BuildContext context) => null;

  Widget? bottomSheet(BuildContext context) => null;

  Widget? floatingActionButton(BuildContext context) => null;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  FloatingActionButtonAnimator? get floatingActionButtonAnimator => null;

  List<Widget>? persistentFooterButtons(BuildContext context) => null;

  AlignmentDirectional get persistentFooterAlignment {
    return AlignmentDirectional.centerEnd;
  }

  bool get primary => true;

  bool? get resizeToAvoidBottomInset => null;

  String? get restorationId => null;

  Color? get drawerScrimColor => null;

  double? get drawerEdgeDragWidth => null;

  DragStartBehavior get drawerDragStartBehavior => DragStartBehavior.start;

  bool get drawerEnableOpenDragGesture => true;

  bool get endDrawerEnableOpenDragGesture => true;

  Widget _buildProvider(
    BuildContext context, {
    required B bloc,
    required Widget child,
  }) {
    final shouldKeepAlive = (bloc as dynamic).keepAlive;

    if (shouldKeepAlive) {
      return BlocProvider<B>.value(value: bloc, child: child);
    }
    return BlocProvider<B>(create: (context) => bloc, child: child);
  }

  Widget buildBody(BuildContext context, B bloc) {
    return _buildProvider(
      context,
      bloc: bloc,
      child: Scaffold(
        key: scaffoldKey,
        appBar: buildAppbar(context),
        backgroundColor: backgroundColor,
        drawer: drawer(context),
        onDrawerChanged: onDrawerChanged,
        endDrawer: endDrawer(context),
        onEndDrawerChanged: onEndDrawerChanged,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        bottomNavigationBar: bottomNavigationBar(context),
        bottomSheet: bottomSheet(context),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons(context),
        persistentFooterAlignment: persistentFooterAlignment,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        restorationId: restorationId,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerDragStartBehavior: drawerDragStartBehavior,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        body: buildView(context),
      ),
    );
  }
}
