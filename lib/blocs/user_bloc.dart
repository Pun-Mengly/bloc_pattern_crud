import 'package:bloc/bloc.dart';
import 'package:crud_api_bloc_pattern/models/user_model.dart';
import 'package:crud_api_bloc_pattern/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  UserBloc({required this.repository}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      List<UserModel> listUser = await repository.getUserModel();

      if (event is GetUserEven) {
        emit(Loading());
        try {
          emit(LoadedSuccess(userModel: listUser));
        } catch (e) {
          print(e);
          emit(LoadedFail(message: e.toString()));
        }
      } else if (event is DeleteUserEven) {
        try {
          await repository.deleteUserModel(event.id);
          emit(DeletedSuccess());
        } catch (e) {
          emit(DeletedFail(message: e.toString()));
        }
      } else if (event is PostUserEvent) {
        try {
          await repository.postUserModel(event.userModel);
          emit(PostSuccess());
        } catch (e) {
          emit(PostFail(message: e.toString()));
        }
      }
    });
  }
}
