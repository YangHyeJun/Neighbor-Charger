import 'package:flutter/cupertino.dart';
import 'package:neighbor_chargers/ui/splash_view.dart';
import 'package:neighbor_chargers/ui/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: Consumer<SplashViewModel>(
        builder: (context, viewModel, child) {
          return SplashView();
        },
      ),
    );
  }
}