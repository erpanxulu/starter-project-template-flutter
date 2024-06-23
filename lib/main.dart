import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo_mobx_app/features/auth/stores/auth_store.dart';
import 'package:mytodo_mobx_app/features/auth/views/login_view.dart';
import 'package:mytodo_mobx_app/features/todo/stores/todo_store.dart';
import 'package:mytodo_mobx_app/features/todo/views/home_view.dart';
import 'package:mytodo_mobx_app/injection.dart';
import 'package:provider/provider.dart';

void main() async {
  await setupSl();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  LoginView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => sl<TodoStore>()),
        Provider(create: (_) => sl<AuthStore>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade700),
            useMaterial3: true,
          ),
          routerConfig: _router,
        ),
      ),
    );
  }
}
