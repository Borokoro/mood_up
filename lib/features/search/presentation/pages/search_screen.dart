import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/details/presentation/bloc/detail_cubit.dart';
import 'package:mood_up/features/images/presentation/images_cubit.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import 'package:mood_up/features/search/presentation/widgets/search_widgets.dart';
import 'package:mood_up/features/skeleton/presentation/bloc/skeleton_cubit.dart';
import '../bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoading) {
        return Column(
          children: [
            searchBarLoadingOrLoaded(context, searchController),
            const Expanded(
                child: Center(
              child: SizedBox(
                  height: 41, width: 41, child: CircularProgressIndicator()),
            )),
          ],
        );
      }
      if (state is SearchError) {
        return Center(
          child: Text('Error: ${state.message}'),
        );
      }
      if (state is SearchInitialState) {
        return Column(
          children: [
            searchBarInitial(context, searchController),
            initialStateView(),
          ],
        );
      }
      if (state is SearchLoaded) {
        if (state.data.isEmpty) {
          return Column(
            children: [
              searchBarLoadingOrLoaded(context, searchController),
              Expanded(
                  child: Center(
                child: noResultsFound(),
              )),
            ],
          );
        }
        return BlocBuilder<ImagesCubit, ImagesState>(
          builder: (context, stateImg) {
            if (stateImg is ImagesInitialState) {
              BlocProvider.of<ImagesCubit>(context)
                  .cacheAllImagesSearch(context, state.data);
              return const CircularProgressIndicator();
            }
            if (stateImg is ImagesLoadingState) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                searchBarLoadingOrLoaded(context, searchController),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<DetailCubit>()
                                  .changeDetailIndex(index);
                              context.read<SkeletonCubit>().goToDetailPage();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
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
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            title(state.data[index].title),
                                            creators(state.data[index].writers),
                                            const SizedBox(height: 16),
                                            Expanded(child: LayoutBuilder(
                                              builder: (context, constraints) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 14),
                                                  child: description(
                                                      state.data[index]
                                                          .description,
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
                  ),
                ),
              ],
            );
          },
        );
      }
      return const Center(
        child: Text('Error'),
      );
    });
  }
}
