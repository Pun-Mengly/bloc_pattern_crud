part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUserEven extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteUserEven extends UserEvent {
  final int id;

  DeleteUserEven({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostUserEvent extends UserEvent {
  final UserModel userModel;

  PostUserEvent({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
