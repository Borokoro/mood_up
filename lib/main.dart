import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/bloc_observer.dart';
import 'package:mood_up/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:mood_up/features/home/presentation/pages/home_screen.dart';
import 'package:mood_up/features/search/presentation/pages/search_screen.dart';
import 'package:routemaster/routemaster.dart';
import 'package:mood_up/config/routes.dart' as r;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<BottomNavigationCubit>()),
      ],
     /* child: MaterialApp(
        theme: ThemeData.light(),
        title: 'MoodUp',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          '/Search': (context) => SearchScreen(),
        },
      ),
    ); */
    child: MaterialApp.router(
          theme: ThemeData.light(),
          title: 'MoodUp',
          debugShowCheckedModeBanner: false,
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) => r.Router.onboardingCompletedRouteMap,
          ),
        ),
    );
  }
}
