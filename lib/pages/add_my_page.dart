import 'package:crud_api_bloc_pattern/blocs/user_bloc.dart';
import 'package:crud_api_bloc_pattern/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMyHomePage extends StatelessWidget {
  const AddMyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              hintText: 'Name',
            ),
          ),
          TextFormField(
            controller: username,
            decoration: InputDecoration(
              hintText: 'Username',
            ),
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                UserModel user = UserModel(
                    id: 0,
                    name: name.text,
                    username: username.text,
                    email: email.text,
                    address: Address(
                        street: 'address',
                        suite: '',
                        city: '',
                        zipcode: '',
                        geo: Geo(lat: '', lng: '')),
                    phone: '0987654e',
                    website: 'web@gmail.com',
                    company: Company(
                        name: 'ASALO', bs: '89HBH', catchPhrase: '008HFJ'));

                BlocProvider.of<UserBloc>(context)
                  ..add(PostUserEvent(userModel: user));
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
