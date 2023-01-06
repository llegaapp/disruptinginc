import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:alubian/models/main.dart';
import 'package:alubian/config/constant.dart';

class ApiConfig {
  static ApiConfig? instance = ApiConfig.init();
  ApiConfig() {
    ApiConfig.init();
  }
  late final Dio dio;

  ApiConfig.init() {
    dio = Dio(BaseOptions(
      baseUrl: Constant.baseUrl,
    ));
  }
  Future request<T extends BaseModel>({
    required ReqTypes method,
    required String path,
    dynamic data,
    required T model,
    Map<String, dynamic>? queryParameters,
    bool isBaseResponse = true,
    isFile = false,
  }) async {
    data ??= {};
    try {
      var body = data is Map || data is FormData ? data : data.toJson();

      var response = await dio.request(path,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            contentType: 'application/x-www-form-urlencoded',
            method: method.name,
          ));

      if (response.statusCode == 200) {
        if (response.data is List) {
          var list = <T>[];
          for (var element in (response.data as List)) {
            list.add(model.fromJson(element));
          }
          return list.isNotEmpty ? list : model;
        }
        return model.fromJson(response.data);
      } else {
        log('$path ${method.name} FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        return null;
      }
    } on DioError catch (dioError) {
      log('$path ${method.name} DIO ERROR | Error : $dioError');
      return null;
    } catch (error) {
      log('$path ${method.name} ERROR | Error : $error');
      return null;
    }
  }
}
