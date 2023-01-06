//import 'package:ecommerce_test/all_categories.dart';
//import 'package:ecommerce_test/service.dart';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/config/user_preferences.dart';
import 'package:alubian/data_source/api_services.dart';
import 'package:flutter/material.dart';

import '../../config/lang/generated/locale_keys.g.dart';
import '../../widgets/primary_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // final _prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.secondary,
        foregroundColor: context.colors.onBackground,
        title: Text(LocaleKeys.register_title.tr().toTitleCase()),
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: username,
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
                  controller: password,
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
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: PrimaryElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> body = {
                            "username": username.text,
                            "password": password.text,
                            "email": "user@user.com",
                            "name": {"firstname": "John", "lastname": "Doe"},
                            "address": {
                              "city": 'kilcoole',
                              "street": '7835 new road',
                              "number": 3,
                              "zipcode": '12926-3874',
                              "geolocation": {
                                "lat": '-37.3159',
                                "long": '81.1496'
                              },
                              "phone": '1-570-236-7033'
                            }
                          };

                          print(body);
                          var body2 = jsonEncode(body);
                          final result =
                              await registerService().registerUser(body2);

                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Success: ' + result.toString())));
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Error intentelo nuevamente")));
                          }
                          // final getToken = await loginService()
                          //     .userLogin(usernameCont.text, passwordCont.text);
                          //
                          // if (getToken['token'] != null) {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(SnackBar(content: Text('Success: ' + getToken['token'])));
                          // _prefs.setPreference(UserPreferences.token, getToken['token']);
                          // _prefs.setPreference(UserPreferences.user, usernameCont.text);
                          // _prefs.setPreference(UserPreferences.pass, passwordCont.text);
                          // Future.delayed(Duration(seconds: 2), () {
                          //   Navigator.pushReplacement(context,
                          //       MaterialPageRoute(builder: (context) {
                          //         //return AllCategories();
                          //       }));
                          // });
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //         content: Text('Incorrect Username or Password')));
                          //   }
                        },
                        localizationKey: LocaleKeys.register_name)),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'If you send an object like the code above, it will return you an object with a new id. remember that nothing in real will insert into the database. so if you want to access the new id you will get a 404 error.',
                    style: context.textTheme.caption!.copyWith(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
