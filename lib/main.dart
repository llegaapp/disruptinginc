import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/config/constant.dart';
import 'package:alubian/config/lang/language_manager.dart';
import 'package:alubian/config/nav.dart';
import 'package:alubian/config/theme/cubit/theme_cubit.dart';
import 'package:alubian/pages/cart/bloc/bag_bloc.dart';
import 'package:alubian/pages/shop/cubit/shop_cubit.dart';
import 'package:alubian/data_source/api_services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.supportedLocales,
      path: Constant.translationsPath,
      fallbackLocale: LanguageManager.esLocale,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => BagBloc()..add(BagInitialized()),
                ),
                BlocProvider(
                  create: (context) => ShopCubit(ShopService()),
                ),
              ],
              child: MyApp(
                state: state,
              ),
            );
          },
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.state,
  }) : super(key: key);
  final ThemeState? state;
  @override
  Widget build(BuildContext context) {
    final _prefs = new UserPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: Constant.applicationName,
      theme: state!.currentTheme,
      routes: NavigationManager.routes,
    );
  }
}
