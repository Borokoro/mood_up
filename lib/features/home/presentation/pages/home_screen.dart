import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/details/presentation/pages/detail_screen.dart';
import 'package:mood_up/features/home/presentation/bloc/home_bloc.dart';
import 'package:mood_up/features/home/presentation/widgets/home_widgets.dart';
import 'package:mood_up/features/images/presentation/images_cubit.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import 'package:mood_up/features/skeleton/presentation/bloc/skeleton_cubit.dart';

import '../../../details/presentation/bloc/detail_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if(context.read<HomeBloc>().state.data.isEmpty) {
      context.read<HomeBloc>().add(const FetchComicsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomeError) {
        return const Center(
          child: Text('Error'),
        );
      }
      return BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, stateImg) {
          if (stateImg is ImagesInitialState) {
            BlocProvider.of<ImagesCubit>(context)
                .cacheAllImages(context, state.data);
            return Center(child: const CircularProgressIndicator());
          }
          if (stateImg is ImagesLoadingState) {
            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      context.read<DetailCubit>().changeDetailIndex(index);
                      context.read<SkeletonCubit>().goToDetailPage();
                    },
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Color(0xff00000014),
                          spreadRadius: 0,
                          blurRadius: 24,
                          offset: Offset(2, 6),
                          blurStyle: BlurStyle.outer,
                        )
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          imageCover(
                              '${state.data[index].imageUrl}/${c.imageHS}.${state.data[index].imageExtension}'),
                          Expanded(
                            child: SizedBox(
                              height: 183,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    title(state.data[index].title),
                                    creators(state.data[index].writers),
                                    const SizedBox(height: 16),
                                    Expanded(child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 14),
                                          child: description(
                                              state.data[index].description,
                                              constraints.maxHeight,
                                              index),
                                        );
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 16,
                    ),
                itemCount: state.data.length),
          );
        },
      );
    });
  }
}
