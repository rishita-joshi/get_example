import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_course_get_api/model/user_model.dart';

class HttpConfig {
  List<UserModel> userModel = [];
  String baseUrl = "https://api.github.com/users";

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      userModel = data.map((e) => UserModel.fromJson(e)).toList();
    }

    return userModel;
  }

Future<List<UserModel>> postUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      userModel = data.map((e) => UserModel.fromJson(e)).toList();
    }

    return userModel;
  }


}
