import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/nc_viewmodel.dart';

abstract class NCFormatView<T extends NCViewModel> extends NCView<T> {
  @override
  Widget draw() {
    return Scaffold(
      appBar: drawAppBar(super.context),
      body: SafeArea(child: Stack(children: <Widget>[_draw()])),
    );
  }

  Widget _draw() {
    return Column(
      children: <Widget>[
        drawHeader(),
        Expanded(child: drawBody()),
        drawFooter(),
      ],
    );
  }

  PreferredSizeWidget? drawAppBar(BuildContext context) => null;

  Widget drawHeader() => const SizedBox.shrink();

  Widget drawBody() => const SizedBox.shrink();

  Widget drawFooter() => const SizedBox.shrink();
}

abstract class NCView<T extends NCViewModel> extends StatelessWidget {
  late BuildContext context;
  late final T viewModel;
  bool _isCompletedSetup = false;

  @override
  Widget build(BuildContext context) {
    if (!_isCompletedSetup) {
      _setUp(context);
    }
    this.context = context;
    return draw();
  }

  Widget draw();

  void _setUp(BuildContext context) {
    viewModel = Provider.of<T>(context);
    _isCompletedSetup = true;
  }
}
