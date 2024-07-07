import 'package:flutter/material.dart';
import 'package:mood_up/features/home/data/models/home_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

detailsPanelHome(BuildContext context, HomeDataModel homeDataModel, Function callBack, int buttonPressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        height: buttonPressed == 0 ? 274 : 434,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 33, left: 16, right: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(homeDataModel.title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: Color(0xff262424)
                ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  for(int i=0;i<homeDataModel.writers.length;i++)
                    Text('${homeDataModel.writers[i]}, ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffc4c4c4),
                    ),
                    ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Text(
               homeDataModel.description,
               softWrap: true,
               overflow: TextOverflow.fade,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262424),
                ),
              ),
              ),
            SizedBox(height: 5,),
            loadMoreButton(callBack, buttonPressed, context, homeDataModel),
              SizedBox(height: 10,),
            ],
          ),
        ),
        ),
    ],
  );
}

loadMoreButton(Function callBack, int buttonPressed, BuildContext context, HomeDataModel homeDataModel){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 52,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: ElevatedButton(
        onPressed: buttonPressed < 1 ? () => callBack() : () async{
          var url=homeDataModel.detailsUrl;
          if(await canLaunchUrl(Uri.parse(url))){
            await launchUrl(Uri.parse(url));
          }
          else{
            throw 'Error could not launch';
          }
        },
        child: Center(
            child: Text(
              'Find out more',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
        ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xfff33335),
      ),
    ),
  );
}
