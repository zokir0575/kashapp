import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kash_app/features/profile/presentation/bloc/user_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserBloc userBloc;

  @override
  void initState() {
    userBloc = UserBloc()..add(UserEvent.getUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userBloc,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.users[index].firstName,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      state.users[index].lastName,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                );
              },
              itemCount: state.users.length,
            );
          },
        ),
      ),
    );
  }
}
