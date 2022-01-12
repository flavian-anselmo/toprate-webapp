
import 'package:flutter/material.dart';

const ksearchFieldDecoration = InputDecoration(
  /**decoratuion for the search field which can also be reused
   * which can be reused with other textfields in future 
   * */
  hintText: 'By Location or Name',
  labelText: 'Search',
  prefixIcon: Icon(Icons.search),
);

//theme colors for the application
const kapppthemecolor = Color(0xFF144E85);
const ksecondaryAPPthemecolor = Colors.blue;

//side bar text
const ksidebarUserInfoText = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

//splash screen text
const ksplashtext = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

const ksplashspacertxt = TextStyle(
  color: ksecondaryAPPthemecolor,
  fontSize: 25,
);

//login dont have account button & forgot password
const kauthtxtbuttondecoration = TextStyle(
  color: Colors.blueGrey,
  fontSize: 12.0,
);
const kloginbutton = TextStyle(fontSize: 15.0);

var kelevatedbutton = ElevatedButton.styleFrom(
  primary: ksecondaryAPPthemecolor,
);

//constants for the inputs
final ktextFieldDEcoratiion = InputDecoration(
  labelText: 'full name',
  prefixIcon: const Icon(Icons.person),
  fillColor: Colors.white,
  hintText: '',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: ksecondaryAPPthemecolor,
    ),
  ),
);