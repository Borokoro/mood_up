import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String route='/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchComicsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<HomeBloc,HomeState>(
            builder: (context, state){
              if(state is HomeLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is HomeError){
                return const Center(
                  child: Text('Error'),
                );
              }
              return const Center(
                child: Text("Everything good"),
              );
            }
        ),
      );
  }
}
