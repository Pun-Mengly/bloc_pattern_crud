part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class LoadedSuccess extends UserState {
  final List<UserModel> userModel;

  LoadedSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class Loading extends UserState {
  @override
  List<Object> get props => [];
}

class LoadedFail extends UserState {
  final String message;

  LoadedFail({required this.message});

  @override
  List<Object> get props => [];
}

class DeletedSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class DeletedFail extends UserState {
  final String message;

  DeletedFail({required this.message});

  @override
  List<Object> get props => [message];
}

class PostSuccess extends UserState {
  // final UserModel userModel;
  //
  // PostSuccess({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostFail extends UserState {
  final String message;

  PostFail({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
