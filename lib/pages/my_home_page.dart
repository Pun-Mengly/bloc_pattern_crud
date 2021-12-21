import 'package:crud_api_bloc_pattern/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, 'add-my-home-page');
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            }
            if (state is LoadedSuccess) {
              return ListView.builder(
                  itemCount: state.userModel.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text(state.userModel[index].name![0])),
                      title: Text(state.userModel[index].name!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          int id = state.userModel[index].id!;
                          BlocProvider.of<UserBloc>(context)
                            ..add(DeleteUserEven(id: id));
                        },
                      ),
                      subtitle: Text(state.userModel[index].company!.name!),
                    );
                  });
            } else if (state is LoadedFail) {
              return Center(
                child: Text(state.message),
              );
            }
            return Text('No');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<UserBloc>(context)..add(GetUserEven());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
