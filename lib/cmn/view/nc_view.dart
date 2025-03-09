import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class NCView<T extends ChangeNotifier> extends StatelessWidget {
  const NCView({super.key});

  @override
  Widget build(BuildContext context) {
    T viewModel = Provider.of<T>(context);
    return buildBody(context, viewModel);
  }

  Widget buildBody(BuildContext context, T viewModel);
}
