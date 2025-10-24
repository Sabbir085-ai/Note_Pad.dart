import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/routes/route_pages.dart';
import 'package:note_pad/routes/routes.dart';
//import "package:hive/hive.dart";

//import 'package:note_pad/screens/bottom_nav_bar_screen.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.bottom_nav_bar,
      getPages: AppPages.routes,
    );
  }
}