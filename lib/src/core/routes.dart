import 'package:exercitar_0/src/core/injection.dart';
import 'package:exercitar_0/src/features/login/data/repository/login_repository.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_bloc.dart';
import 'package:exercitar_0/src/features/login/ui/view/login_page.dart';
import 'package:exercitar_0/src/features/signUp/data/repository/sign_up_repository.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_bloc.dart';
import 'package:exercitar_0/src/features/signUp/ui/view/sign_up_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRoute = GoRouter(
  initialLocation: '/LoginPage',
  routes: [
    GoRoute(
      path: '/LoginPage',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(repository: getIt<LoginRepository>()),
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: '/SignUpPage',
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpBloc(repository: getIt<SignUpRepository>()),
        child: SignUpPage(),
      ),
    )
  ],
);
