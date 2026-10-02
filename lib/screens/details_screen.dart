import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/core/sqlite_helper.dart';
import 'package:my_places/models/place_model.dart';
import 'package:my_places/widgets/custom_button.dart';
import 'package:my_places/widgets/position_container.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.place});
  final PlaceModel place;
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
   
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(place.imagePath),
              width: ScreenSize.width,
              height: ScreenSize.height * 0.42,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: ScreenSize.height * 0.035,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Text(
                    'Description',
                    style: TextStyle(
                      color:Theme.of(context).primaryColorDark,
                      fontSize: ScreenSize.height * 0.025,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.01),
                  Text(
                    place.description,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: ScreenSize.height * 0.02,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Text(
                    'Location',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: ScreenSize.height * 0.025,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PositionContainer(txt: 'Latitude', value: place.latitude),
                      PositionContainer(
                        txt: 'Longitude',
                        value: place.longitude,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  OutlinedButton(
                    onPressed: () async {},
                    style: OutlinedButton.styleFrom(
                      iconColor: Theme.of(context).primaryColor,
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: ScreenSize.width * 0.02),
                        Text(
                          'Open in Maps',
                          style: TextStyle(color: Theme.of(context).primaryColorDark),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                      Text(
                        'Date Added: ${place.createdAt.day}/${place.createdAt.month}/${place.createdAt.year}',
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: ScreenSize.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        color: Theme.of(context).primaryColorLight,
                        txt: 'Edit',
                        onPressed: () {
                          //implement
                        },
                      ),
                      CustomButton(
                        color: Colors.redAccent,
                        txt: 'Delete',
                        onPressed: () async {
                          await SqliteHelper.deletePlace(place.id!);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
