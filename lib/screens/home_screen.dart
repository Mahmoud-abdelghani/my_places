import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/core/sqlite_helper.dart';
import 'package:my_places/models/place_model.dart';
import 'package:my_places/screens/add_screen.dart';
import 'package:my_places/screens/details_screen.dart';
import 'package:my_places/screens/settings_screen.dart';
import 'package:my_places/widgets/category_containder.dart';
import 'package:my_places/widgets/custom_card.dart';
import 'package:my_places/widgets/cutom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });
  final Function(bool?)? onThemeChanged;
  final Function(String?)? onLanguageChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    'All',
    'resturant',
    'Travel',
    'cafe',
    'hotel',
    'Other',
  ];
  List<Color> colors = [
    Colors.black,
    Color(0xffD4D4D4),
    Color(0xffD4D4D4),
    Color(0xffD4D4D4),
    Color(0xffD4D4D4),
    Color(0xffD4D4D4),
  ];
  List<PlaceModel> places = [];
  List<PlaceModel> filteredPlaces = [];
  int selectedCategoryIndex = 0;
  Future<void> _refreshPlaces() async {
    places = await SqliteHelper.getPlaces();
    if (selectedCategoryIndex == 0) {
      filteredPlaces = places;
    } else {
      filteredPlaces = places
          .where(
            (element) => element.category == categories[selectedCategoryIndex],
          )
          .toList();
    }
    setState(() {});
  }

  @override
  void initState() {
    _refreshPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Rebuild');
    ScreenSize.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
          await _refreshPlaces();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: ScreenSize.height * 0.02),
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize.height * 0.01,
                horizontal: ScreenSize.width * 0.05,
              ),
              width: ScreenSize.width,
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.height * 0.03),
                  Row(
                    children: [
                      Text(
                        'My Places',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: ScreenSize.height * 0.03,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(
                                placesCount: places.length,
                                onThemeChanged: widget.onThemeChanged,
                                onLanguageChanged: widget.onLanguageChanged,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.light_mode_outlined,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search places...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenSize.width * 0.02,
                right: ScreenSize.width * 0.02,
              ),
              child: SizedBox(
                width: ScreenSize.width,
                height: ScreenSize.height * 0.06,
                child: ListView.separated(
                  itemBuilder: (context, index) => CategoryContainder(
                    onTap: () async {
                      selectedCategoryIndex = index;
                      await _refreshPlaces();
                      setState(() {});
                    },
                    isPressed: selectedCategoryIndex == index,
                    txt: categories[index],
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: ScreenSize.width * 0.035),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: ScreenSize.height * 0.02)),
          filteredPlaces.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width * 0.02,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: ScreenSize.height * 0.15),
                        CircleAvatar(
                          radius: ScreenSize.height * 0.08,
                          backgroundImage: AssetImage('assets/Container.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        Text(
                          'No places saved yet',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: ScreenSize.height * 0.025,
                          ),
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        Text(
                          'Save photos, notes, and locations of your favorite spots.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenSize.height * 0.02,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ScreenSize.height * 0.015),
                        CutomButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddScreen(),
                              ),
                            );
                            await _refreshPlaces();
                          },
                          txt: 'Add your first place',
                        ),
                      ],
                    ),
                  ),
                )
              : SliverList.separated(
                  itemBuilder: (context, index) => CustomCard(
                    place: PlaceModel(
                      name: filteredPlaces[index].name,
                      description: filteredPlaces[index].description,
                      category: filteredPlaces[index].category,
                      imagePath: filteredPlaces[index].imagePath,
                      latitude: filteredPlaces[index].latitude,
                      longitude: filteredPlaces[index].longitude,
                      createdAt: filteredPlaces[index].createdAt,
                    ),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(place: filteredPlaces[index]),
                        ),
                      );
                      await _refreshPlaces();
                    },
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ScreenSize.height * 0.02),
                  itemCount: filteredPlaces.length,
                ),
        ],
      ),
    );
  }
}
