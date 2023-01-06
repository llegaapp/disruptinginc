import 'package:flutter/src/painting/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences? _prefs;

  static String token = "token";
  static String user = "user";
  static String pass = "pass";

  // static String flag = "flag";
  // static String flag1 = "flag1";


  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  isTokenActive() {
    return _prefs!.getString('token') != null ? true : false;
  }


  // String get token {
  //   return _prefs!.getString('token') ?? '';
  // }
  //
  // set token(String value) {
  //   _prefs!.setString('token', value);
  // }

  String get id {
    return _prefs!.getString('id') ?? '';
  }

  set id(String value) {
    _prefs!.setString('id', value);
  }

  String getPreference(String key) {
    String text = "";
    try{
      text = _prefs!.getString(key)!;
      if(text == null)
        text = "";
    }catch(ex){}
    return text;
    //return _prefs.getString(name) ?? '';
  }

  setPreference(String name, String value) {
    _prefs?.setString(name, value);
  }

  // clearUser(){
  //   setPreference(UserPreferences.email, "");
  //   //set(UserPreferences., "");
  //   //set(Pref.userToken, "");
  // }

  removePreference(String name) {
    _prefs?.remove(name);
  }
}
