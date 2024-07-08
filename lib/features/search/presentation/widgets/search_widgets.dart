import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

imageCover(String imagePath) {
  if (imagePath == "/portrait_xlarge.") {
    return SizedBox(
      width: 116,
      height: 183,
      child: Image.asset(
        'assets/icons/PlaceholderCover.png',
        fit: BoxFit.fill,
      ),
    );
  }
  return SizedBox(
    width: 116,
    height: 183,
    child: Image.network(
      imagePath,
      fit: BoxFit.fill,
    ),
  );
}

title(String title) {
  return Text(
    title,
    softWrap: true,
    style: const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Color(0xff262424),
    ),
  );
}

creators(List<String> creators) {
  return Wrap(
    direction: Axis.horizontal,
    children: [
      const Text('written by ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            color: Color(0xffc4c4c4),
            fontSize: 11,
          )),
      for (int i = 0; i < creators.length; i++)
        Text('${creators[i]}, ',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color(0xffc4c4c4),
              fontSize: 11,
            )),
    ],
  );
}

description(String description, double remainingHeight, int i) {
  return Text(description,
      softWrap: true,
      maxLines: remainingHeight == 109
          ? 5
          : remainingHeight <= 93 && remainingHeight >= 67
              ? 4
              : remainingHeight == 51
                  ? 2
                  : 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: Color(0xff262424),
        fontSize: 12,
      ));
}

initialStateView() {
  return Padding(
    padding: const EdgeInsets.only(top: 256),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 62,
          child: Image.asset('assets/icons/open-book.png'),
        ),
        const Text('Start typing to find a particular comics.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color(0xff262424),
              fontSize: 18,
            )),
      ],
    ),
  );
}

noResultsFound() {
  return Padding(
    padding: const EdgeInsets.only(top: 197, left: 17, right: 17),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 62,
          height: 62,
          child: Image.asset('assets/icons/find.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: Text(
              'There is no comic book with that name in our library. Check the spelling and try again.',
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: Color(0xff262424),
                fontSize: 18,
              )),
        ),
      ],
    ),
  );
}

searchBarLoadingOrLoaded(BuildContext context, TextEditingController searchController){
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Row(
      children: [
        Container(
          width: 270,
          height: 40,
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
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    IconData(0xe567, fontFamily: 'MaterialIcons'),
                    size: 20,
                    color: Color(0xff7e7e7e),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    onFieldSubmitted: (searchController) {
                      BlocProvider.of<SearchBloc>(context).add(
                          FetchSearchResultEvent(
                              searchPhrase: searchController));
                    },
                    controller: searchController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Search for a comic book',
                      hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xffb1b1b1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: TextButton(
                onPressed: () {
                  searchController.text = "";
                  context
                      .read<SearchBloc>()
                      .add(const ClearSearchResultEvent());
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Color(0xffb1b1b1),
                  ),
                )),
          ),
        ),
      ],
    ),
  );
}

searchBarInitial(BuildContext context, TextEditingController searchController){
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Container(
      //width: 328,
      height: 40,
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
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                IconData(0xe567, fontFamily: 'MaterialIcons'),
                size: 20,
                color: Color(0xffcfcfcf),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                onFieldSubmitted: (searchController) {
                  BlocProvider.of<SearchBloc>(context).add(
                      FetchSearchResultEvent(
                          searchPhrase: searchController));
                },
                controller: searchController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Search for a comic book',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xffb1b1b1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
