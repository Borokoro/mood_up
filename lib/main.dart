import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/bloc_observer.dart';
import 'package:mood_up/features/Search/presentation/bloc/search_bloc.dart';
import 'package:mood_up/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:mood_up/features/images/presentation/images_cubit.dart';
import 'package:routemaster/routemaster.dart';
import 'package:mood_up/config/routes.dart' as r;
import 'features/home/presentation/bloc/home_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<SearchBloc>()),
        BlocProvider(create: (_) => locator<BottomNavigationCubit>()),
        BlocProvider(create: (_) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<ImagesCubit>()),
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
