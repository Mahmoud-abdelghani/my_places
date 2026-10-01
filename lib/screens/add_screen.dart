import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/widgets/custom_field.dart';
import 'package:my_places/widgets/cutom_button.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> descriptionFormKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  List<String> categories = ['resturant', 'Travel', 'cafe', 'hotel', 'Other'];
  String? selectedCat;
  ImagePicker imagePicker = ImagePicker();
  String? imagePath;
  Position? position;
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: Color(0xff0F172A),
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Color(0xff334155))),
        backgroundColor: Color(0xff1E293B),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Add New Place',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenSize.height * 0.029,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenSize.height * 0.02),
              Text(
                'Add place image',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.01),
              GestureDetector(
                onTap: () async {
                  imagePath = await _pickImage();
                  setState(() {});
                },
                child: Container(
                  height: ScreenSize.height * 0.25,
                  width: ScreenSize.width,
                  decoration: BoxDecoration(
                    color: Color(0xff1E293B),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xff334155)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: imagePath == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: ScreenSize.height * 0.04,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/Container2.png',
                              ),
                            ),
                            Text(
                              'Add place image',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenSize.height * 0.025,
                              ),
                            ),
                          ],
                        )
                      : Image.file(File(imagePath!), fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.02),
              Text(
                'Add place Name',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.01),
              CustomField(
                formKey: nameFormKey,
                txt: 'Place Name',
                controller: nameController,
                minLines: 1,
              ),
              SizedBox(height: ScreenSize.height * 0.02),
              Text(
                'Add place discription',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.01),
              CustomField(
                formKey: descriptionFormKey,
                txt: 'Place discription',
                controller: descriptionController,
                minLines: 2,
              ),
              SizedBox(height: ScreenSize.height * 0.02),
              Text(
                'Add place category',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.01),
              DropdownButtonFormField(
                dropdownColor: Color(0xff0F172A),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1E293B)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0xff1E293B4D),
                ),
                items: categories
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(color: Colors.white)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedCat = value;
                },
              ),
              SizedBox(height: ScreenSize.height * 0.02),
              Text(
                'Get Current Location',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenSize.height * 0.02,
                ),
              ),
              SizedBox(height: ScreenSize.height * 0.01),
              position == null
                  ? OutlinedButton(
                      onPressed: () async {
                        position = await _pickLocation();
                        setState(() {});
                      },
                      style: OutlinedButton.styleFrom(
                        iconColor: Color(0xff14B8A6),
                        backgroundColor: Color(0xff1E293B4D),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff14B8A6),
                          ),
                          SizedBox(width: ScreenSize.width * 0.02),
                          Text(
                            'Get Current Location',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      'Latitude ${position!.latitude}, Longitude ${position!.longitude}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenSize.height * 0.02,
                      ),
                    ),
              SizedBox(height: ScreenSize.height * 0.02),
              Align(
                alignment: Alignment.bottomCenter,
                child: CutomButton(onPressed: () {}, txt: 'Save Place'),
              ),
              SizedBox(height: ScreenSize.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _pickImage() async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return null;
    return image.path;
  }

  Future<Position> _pickLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
