import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.formKey,
    required this.txt,
    required this.controller,
    required this.minLines,
  });
  final GlobalKey<FormState> formKey;
  final String txt;
  final TextEditingController controller;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,

      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        minLines: minLines,
        maxLines: 3,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xff1E293B4D),
          hintText: txt,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff14B8A6)),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff1E293B)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
