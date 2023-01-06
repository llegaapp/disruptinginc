import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:alubian/config/constant.dart';
import 'package:alubian/data_source/api_config.dart';
import 'package:alubian/models/profile.dart';
import 'package:alubian/models/product.dart';

import '../config/user_preferences.dart';
class ProfileService {
  final ApiConfig? _networkManager = ApiConfig.instance;
  Future<ProfileModel?> fetchProfile() async {
    return await _networkManager!.request(
        method: ReqTypes.get,
        path: Constant.profile,
        model: ProfileModel());
  }
}
class ShopService {
  final ApiConfig? _networkManager = ApiConfig.instance;

  Future<List<Product>?> fetchAllProducts(
      {Map<String, dynamic>? params}) async {
    return await _networkManager!.request(
      method: ReqTypes.get,
      path: Constant.products,
      model: Product(),
      queryParameters: params,
    );
  }
}

class loginService {
  final _prefs = new UserPreferences();
  // final ApiConfig? _networkManager = ApiConfig.instance;

  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com'+Constant.log);
    final result = await http
        .post(loginUrl, body: {'username': username, 'password': password});

    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }
}

class registerService {
  
  Future registerUser(String params) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/users");

    final result = await http
        .post(loginUrl, body: params);

    print(result.statusCode);
    print(result.body);
    return result;
  }
}
