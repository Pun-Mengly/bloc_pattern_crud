import 'dart:convert';

import 'package:crud_api_bloc_pattern/models/user_model.dart';
import 'package:crud_api_bloc_pattern/repositories/user_repository.dart';
import 'package:http/http.dart ' as http;

class UserService implements UserRepository {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  @override
  Future<List<UserModel>> getUserModel() async {
    http.Response response = await http.get(Uri.parse(url));
    List lstUser = json.decode(response.body);
    List<UserModel> user = lstUser.map((e) => UserModel.fromJson(e)).toList();
    return user;
  }

  @override
  deleteUserModel(int id) async {
    http.Response response = await http.delete(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print('Delete id: $id');
      return true;
    }
    return false;
  }

  @override
  Future<UserModel?> postUserModel(UserModel userModel) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var body = json.encode(userModel.toJson());
    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('record was create');
      print(response.body);
    }
    return null;
  }
}
