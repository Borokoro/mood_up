import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/bottom_navigation/presentation/widgets/bottom_navigation_widget.dart';
import 'package:mood_up/features/home/presentation/pages/home_screen.dart';
import 'package:mood_up/features/search/presentation/pages/search_screen.dart';
import 'package:mood_up/features/skeleton/presentation/widgets/skeleton_widgets.dart';

import '../../bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';

List<Widget> pages = const[
  SearchScreen(),
  HomeScreen(),
];

class Skeleton extends StatelessWidget {

  static const String route = '/';

  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationChosenScreen>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: state.chosenScreen == 0 ? appBarForHome(context) : null,
          bottomNavigationBar: const BottomNavigationWidget(),
          body: SafeArea(
              child: pages[state.chosenScreen]
          ),
        );
      },
    );
  }
}
