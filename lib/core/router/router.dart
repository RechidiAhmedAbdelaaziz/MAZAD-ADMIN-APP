// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazad_app/features/auction/config/auction_route.dart';
import 'package:mazad_app/features/auth/config/auth.route.dart';


part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    initialLocation: '/login', //TODO home screen
    routes: [...AuthRoute.routes, ...AuctionRoute.routes],
    debugLogDiagnostics: true,
    redirect: _handelRedirect,
  );

  static FutureOr<String?> _handelRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    // final authCubit = locator<AuthCubit>();
    // if (authCubit.state.isAuthanticated) return null;
    // return '/login';
  }
}
