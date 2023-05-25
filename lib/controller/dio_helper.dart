import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static const String url =
      'https://api.freecurrencyapi.com/v1/latest?apikey=Jl4Ro0GluTE2Hx4jRgHOUE9jPICdt4trmSXfLi80';

  static late Dio dio;
  static init() {
    dio = Dio();
  }

  static Future<Map<String, dynamic>> getRequest() async {
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data['data'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return {};
  }
}
