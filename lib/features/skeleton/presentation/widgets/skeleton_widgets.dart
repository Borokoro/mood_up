import 'package:flutter/material.dart';

appBarForHome(BuildContext context){
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