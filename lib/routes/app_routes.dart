

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo_mobx_app/features/auth/views/login_view.dart';
import 'package:mytodo_mobx_app/features/todo/views/home_view.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
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
}