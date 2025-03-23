import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/api_client.dart';
import 'package:flutter_bloc_architecture/data/repositories/auth_repository.dart';
import 'package:flutter_bloc_architecture/data/repositories/reminder_repository.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/blocs/auth_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/cubits/reminder_cubit.dart';
import 'package:flutter_bloc_architecture/presentation/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiClient>(create: (context) => ApiClient()),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(context.read<ApiClient>()),
        ),
        RepositoryProvider<ReminderRepository>(
          create: (context) => ReminderRepository(context.read<ApiClient>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create:
                (context) =>
                    AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<ReminderCubit>(
            create:
                (context) => ReminderCubit(context.read<ReminderRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter BLoC Architecture',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
