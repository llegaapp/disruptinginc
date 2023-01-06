import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/config/user_preferences.dart';
import 'package:alubian/data_source/api_services.dart';
import 'package:alubian/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../config/constant.dart';
import '../../config/lang/generated/locale_keys.g.dart';
import '../../widgets/custom_message.dart';
import '../../widgets/primary_elevated_button.dart';
import '../../widgets/primary_snackbar.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController usernameCont = TextEditingController(text: 'mor_2314');
  TextEditingController passwordCont = TextEditingController(text: '83r5^_');

  final _prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.secondary,
        foregroundColor: context.colors.onBackground,
        title: Text(LocaleKeys.loggin_title.tr().toTitleCase()),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCont,
              decoration: InputDecoration(
                hintText: "Usuario",
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(12),
                isDense: true,
                border: OutlineInputBorder(),
                counterText: '',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
                controller: passwordCont,
                decoration: InputDecoration(
                  hintText: "Contraseña",
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  isDense: true,
                  border: OutlineInputBorder(),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: PrimaryElevatedButton(
                onPressed: () async {
                  final getToken = await loginService()
                      .userLogin(usernameCont.text, passwordCont.text);
                  if (getToken['token'] != null) {
                    PrimarySnackbar.show(
                        context,
                        CustomMessage(
                            translationKey: 'Success: ' + getToken['token'],
                            icon: Lottie.asset(Constant.animDone,
                                repeat: false)));
                    _prefs.setPreference(
                        UserPreferences.token, getToken['token']);
                    _prefs.setPreference(
                        UserPreferences.user, usernameCont.text);
                    _prefs.setPreference(
                        UserPreferences.pass, passwordCont.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                    // Navigator.pop(context);
                    // Future.delayed(Duration(seconds: 2), () {
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (context) {
                    //         //return AllCategories();
                    //       }));
                    // });
                  } else {
                    PrimarySnackbar.show(
                        context,
                        CustomMessage(
                            translationKey: 'Incorrect Username or Password',
                            icon: Lottie.asset(Constant.animRemoved,
                                repeat: false)));
                  }
                },
                localizationKey: LocaleKeys.loggin_title.tr().toTitleCase(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Text(
                ' You can use any of the users username and password available in users API to get token. any other usernames return error.',
                style: context.textTheme.caption!.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
