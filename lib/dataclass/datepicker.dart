import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

 openDatePicker(BuildContext context) async{

  BottomPicker.date(
      height: 250,
      title:  "Set your Birthday",
      titleStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:  15,
          color: HexColor('5b5b5b')
      ),

      onSubmit: (index) async{
        var birth = await  index;
        return  birth;
      },
      bottomPickerTheme: BOTTOM_PICKER_THEME.temptingAzure,
      iconColor:  Colors.black,
  ).show(context);

}