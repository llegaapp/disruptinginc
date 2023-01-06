import 'package:alubian/pages/main_screen.dart';
import 'package:alubian/pages/splash/splash_view.dart';
import 'package:alubian/pages/success/view/success_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    SplashView.id: (context) => const SplashView(),
    BaseView.id: (context) => const BaseView(),
    SuccessView.id: (context) => const SuccessView(),
  };
}
