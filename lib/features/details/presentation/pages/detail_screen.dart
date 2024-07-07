import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/details/presentation/bloc/detail_cubit.dart';
import 'package:mood_up/features/details/presentation/widgets/detail_widgets.dart';
import 'package:mood_up/features/home/presentation/bloc/home_bloc.dart';

import '../../../bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int buttonPressed=0;

  void buttonPressedEvent() {
    print('klik');
    setState(() {
      buttonPressed++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chosenScreen=context.read<BottomNavigationCubit>().state.chosenScreen;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/PlaceholderCover.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: detailsPanelHome(context, context.read<HomeBloc>().state.data[context.read<DetailCubit>().state.index], buttonPressedEvent, buttonPressed),
    );
  }
}

