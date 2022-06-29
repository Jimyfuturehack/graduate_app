import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


 /**openDatePicker(BuildContext context) {

  BottomPicker.date(
      height: 250,
      title:  "Set your Birthday",
      titleStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:  15,
          color: HexColor('5b5b5b')
      ),

      onSubmit: (index) async{
        String birth = await  index.toString();
      },
      minDateTime: DateTime(1970, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      bottomPickerTheme: BOTTOM_PICKER_THEME.temptingAzure,
      iconColor:  Colors.black,

  ).show(context);

}**/

 openDatePicker(BuildContext context) {
    String? birthdate;
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1970, DateTime.september, 5, 12),
        maxTime: DateTime.now(),
        onConfirm: (date) async {
        birthdate = await date.toString();
        },

        currentTime: DateTime.now(),
        locale: LocaleType.en);
    return birthdate;
  }

