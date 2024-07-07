import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/search/presentation/bloc/search_bloc.dart';
import 'package:mood_up/features/details/presentation/bloc/detail_cubit.dart';
import 'package:mood_up/features/details/presentation/widgets/detail_widgets.dart';
import 'package:mood_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import '../../../bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int buttonPressed = 0;

  void buttonPressedEvent() {
    setState(() {
      buttonPressed++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chosenScreen =
        context.read<BottomNavigationCubit>().state.chosenScreen;
    final index = context.read<DetailCubit>().state.index;
    if (chosenScreen == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: context.read<HomeBloc>().state.data[index].imageUrl == ""
              ? imagePlaceholder()
              : imageFromNetwork(
                  '${context.read<HomeBloc>().state.data[index].imageUrl}/${c.imageD}.${context.read<HomeBloc>().state.data[index].imageExtension}'),
        ),
        child: detailsPanelHome(
            context,
            context.read<HomeBloc>().state.data[index],
            buttonPressedEvent,
            buttonPressed),
      );
    }
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoaded) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: state.data[index].imageUrl == ""
                ? imagePlaceholder()
                : imageFromNetwork(
                    '${state.data[index].imageUrl}/${c.imageD}.${state.data[index].imageExtension}'),
          ),
          child: detailsPanelSearch(
              context, state.data[index], buttonPressedEvent, buttonPressed),
        );
      }
      return const Center(
        child: Text('Error'),
      );
    });
  }
}
