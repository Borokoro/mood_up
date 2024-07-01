import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/bloc_observer.dart';

import 'injection_container.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [

    ],
        child: MaterialApp(
          title: 'MoodUp',
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context)
          },
        )
    );
  }
}
