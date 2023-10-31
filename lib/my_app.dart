import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testjob/cubit/user_cubit.dart';

import 'first_option/home_page.dart';
import 'services/users_repository.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit(userRepository))

        // BlocProvider(create: (context) => Cubit()),
      ],
      child: HomePage(),
    );
  }
}
