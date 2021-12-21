import 'package:crud_api_bloc_pattern/blocs/user_bloc.dart';
import 'package:crud_api_bloc_pattern/pages/add_my_page.dart';
import 'package:crud_api_bloc_pattern/pages/my_home_page.dart';
import 'package:crud_api_bloc_pattern/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(repository: UserService()),
      child: MaterialApp(
        routes: {
          '/': (context) => MyHomePage(),
          'add-my-home-page': (context) => AddMyHomePage(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
