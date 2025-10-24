import 'package:get/route_manager.dart';
import 'package:note_pad/routes/routes.dart';
import 'package:note_pad/screens/bottom_nav_bar_screen.dart';
import 'package:note_pad/screens/note_details_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: RouteName.bottom_nav_bar, page: () => BottomNavBarScreen()),

    GetPage(name: RouteName.note_details, page: () => NoteDetailsScreen()),
  ];
}
