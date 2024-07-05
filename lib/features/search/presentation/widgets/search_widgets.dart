import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

imageCover(String imagePath) {
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
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
  );
}

noResultsFound(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 62,
        height: 62,
        child: Image.asset('assets/icons/find.png'),
      ),
      const Expanded(
        child: Text('There is no comic book with that name in our library. Check the spelling and try again.',
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
              color: Color(0xff262424),
              fontSize: 18,
            )),
      ),
    ],
  );
}

searchBarInitialState(TextEditingController searchController){
  return TextFormField(
    controller: searchController,
    decoration: InputDecoration(
      hintText: 'Search for a comic book',
      hintStyle: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xffb1b1b1),
      ),
    ),
  );
}