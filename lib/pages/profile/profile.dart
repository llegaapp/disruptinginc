import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/pages/login/login_view.dart';
import 'package:alubian/pages/register/register_view.dart';
import 'package:alubian/widgets/header_text.dart';
import 'package:alubian/config/extension.dart';

import 'package:alubian/config/lang/generated/locale_keys.g.dart';
import 'package:alubian/config/theme/cubit/theme_cubit.dart';
import 'package:alubian/pages/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/user_preferences.dart';
import '../../widgets/primary_elevated_button.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const ProfileInitialized()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileTile(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      const HeaderText(translationKey: LocaleKeys.profile_title);

  BlocBuilder _buildProfileTile(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (state is ProfileLoad) ? foto(context, state):Container(),
            SizedBox(
              height: 50,
            ),
            PrimaryElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              localizationKey: LocaleKeys.loggin_title.tr().toTitleCase(),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())),
              child: Text(
                "Registrar usuario",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text(
                  'Iniciar Sesión',
                  style: context.textTheme.overline!.copyWith(),
                ),
                Container(
                  child: Text(
                    'You can use any of the users username and password available in users API to get token. any other usernames return error.',
                    style: context.textTheme.caption!.copyWith(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Text(
                  'Registrar usuario.',
                  style: context.textTheme.overline!.copyWith(),
                ),
                Container(
                  child: Text(
                    'If you send an object like the code above, it will return you an object with a new id. remember that nothing in real will insert into the database. so if you want to access the new id you will get a 404 error.',
                    style: context.textTheme.caption!.copyWith(),
                  ),
                ),
              ],
            ),
          ],
        );
        //return ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())), child: Text("Iniciar sesión"));
        // if (state is ProfileLoad) {
        //   return SizedBox(
        //     child: ListTile(
        //       leading: CircleAvatar(
        //         backgroundColor: context.colors.onPrimary,
        //         backgroundImage: const AssetImage(AssetPaths.profileImage),
        //         radius: 30,
        //       ),
        //       title: Text(
        //         '${state.profileModel!.name!.firstname.toString().toTitleCase()} ${state.profileModel!.name!.lastname.toString().toTitleCase()}', // LocaleKeys.common_placeholder_name.tr().toTitleCase(),
        //         style: context.textTheme.headline6!
        //             .copyWith(color: context.colors.onBackground),
        //       ),
        //       subtitle: Text(
        //         state.profileModel!.email!,
        //         style: context.textTheme.caption!
        //             .copyWith(color: context.colors.onBackground),
        //       ),
        //     ),
        //   );
        // }
        // if (state is ProfileError) {
        //   return const Text('ERROR');
        // }

        return const CircularProgressIndicator();
      },
    );
  }

  Widget foto(BuildContext context, ProfileState state) {
    final _prefs = UserPreferences();
    return SizedBox(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.colors.onPrimary,
          backgroundImage: const AssetImage("assets/images/descarga.png"),
          radius: 30,
        ),
        title: Text(
          '${state.profileModel!.name!.firstname.toString().toTitleCase()} ${state.profileModel!.name!.lastname.toString().toTitleCase()}',
          //_prefs.getPreference(UserPreferences.user), // LocaleKeys.common_placeholder_name.tr().toTitleCase(),
          style: context.textTheme.headline6!
              .copyWith(color: context.colors.onBackground),
        ),
        // subtitle: Text(
        //   state.profileModel!.email!,
        //   style: context.textTheme.caption!
        //       .copyWith(color: context.colors.onBackground),
        // ),
      ),
    );
  }

  BlocBuilder<ThemeCubit, ThemeState> _buildThemeButton() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (newValue) {
            context.read<ThemeCubit>().toggleSwitch(newValue);
          },
        );
      },
    );
  }
}
