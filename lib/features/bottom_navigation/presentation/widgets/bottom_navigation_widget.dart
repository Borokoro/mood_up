import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationChosenScreen>(
      builder: (context, state) {
        return SafeArea(
          child: BottomAppBar(
            elevation: 0,
            child: SizedBox(
              width: 360,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<BottomNavigationCubit>(context)
                          .changeScreen(state.chosenScreen, 0, context);
                    },
                    icon: Icon(
                      const IconData(0xe318, fontFamily: 'MaterialIcons'),
                      color: state.chosenScreen == 0 ? Colors.red : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<BottomNavigationCubit>(context)
                          .changeScreen(state.chosenScreen, 1, context);
                    },
                    icon: Icon(
                      const IconData(0xe567, fontFamily: 'MaterialIcons'),
                      color: state.chosenScreen == 1 ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}