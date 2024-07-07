import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_up/features/skeleton/presentation/bloc/skeleton_cubit.dart';

appBarForHome(BuildContext context) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: true,
    title: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Text(
        'Marvel Comics',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

appBarForDetail(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20, left: 16),
      child: IconButton(
        //iconSize: 18.0,
        onPressed: () {
          context.read<SkeletonCubit>().goFromDetailPage();
        },
        icon: const Icon(IconData(
          0xe092,
          fontFamily: 'MaterialIcons',
        )),
      ),
    ),
    title: const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Details',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
