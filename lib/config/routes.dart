import 'package:flutter/material.dart';
import 'package:mood_up/features/home/presentation/pages/home_screen.dart';
import 'package:mood_up/features/search/presentation/pages/search_screen.dart';
import 'package:mood_up/features/skeleton/presentation/skeleton.dart';
import 'package:routemaster/routemaster.dart';
class Router {
  static final RouteMap onboardingCompletedRouteMap = RouteMap(
    routes: {
      HomeScreen.route: (route) => const MaterialPage<dynamic>(
        child: HomeScreen(),
      ),
      SearchScreen.route: (route) => const MaterialPage<dynamic>(
        child: SearchScreen(),
      ),
      Skeleton.route: (route) => const MaterialPage<dynamic>(
        child: Skeleton(),
      ),
    },
  );

  static final RouteMap onboardingNotCompletedRouteMap = RouteMap(routes: {});
}