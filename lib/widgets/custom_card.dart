import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/models/place_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.place, required this.onTap});
  final PlaceModel place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(place.imagePath),
                  width: ScreenSize.width,
                  height: ScreenSize.height * 0.3,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(34, 255, 187, 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    place.category,
                    style: TextStyle(color: Color(0xffFFB900)),
                  ),
                ),
              ],
            ),
      
            SizedBox(height: ScreenSize.height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: ScreenSize.height * 0.03,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.015),
                  Text(
                    place.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: ScreenSize.height * 0.02,
                    ),
                  ),
                  SizedBox(height: ScreenSize.height * 0.015),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Theme.of(context).hintColor),
                      Text(
                        '${place.longitude}, ${place.latitude}',
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: ScreenSize.height * 0.017,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.date_range_outlined, color: Theme.of(context).hintColor),
                      Text(
                        '${place.createdAt.month}/${place.createdAt.day}/${place.createdAt.year}',
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: ScreenSize.height * 0.017,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenSize.height * 0.015),
          ],
        ),
      ),
    );
  }
}
