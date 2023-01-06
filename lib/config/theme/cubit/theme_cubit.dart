import 'package:alubian/config/constant.dart';
import 'package:alubian/config/theme/dark/app_theme_dark.dart';
import 'package:alubian/config/theme/light/app_theme_light.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: false));
  void toggleSwitch(bool value) => emit(state.copyWith(changeTheme: value));
}
