import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytodo_mobx_app/features/auth/stores/auth_store.dart';
import 'package:mytodo_mobx_app/features/todo/stores/todo_store.dart';
import 'package:mytodo_mobx_app/injection.dart';
import 'package:mytodo_mobx_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  await setupSl();
  runApp(const MyApp());
}

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
          routerConfig: AppRoutes().router,
        ),
      ),
    );
  }
}
