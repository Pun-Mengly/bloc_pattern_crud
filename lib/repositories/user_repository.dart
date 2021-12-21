import 'package:crud_api_bloc_pattern/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUserModel();
  Future<UserModel?> postUserModel(UserModel userModel);
  deleteUserModel(int id);
}
