import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvmwithprovider/user_list/models/user_list_model.dart';
import 'package:mvvmwithprovider/utils/constant.dart';

import 'api_status.dart';

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(BASE_URL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response: UserModelsFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
