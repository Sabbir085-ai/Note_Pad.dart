import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/controllers/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/screens/favourite_screen.dart';
import 'package:note_pad/screens/note_screen.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';

class BottomNavBarScreen extends StatefulWidget {
  
  const BottomNavBarScreen({super.key});
  

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  NoteController controller=Get.put(NoteController()); //Getx Based object
  TextEditingController _titleCtl = TextEditingController();
  TextEditingController _discriptionCtl = TextEditingController();
  
  //final Box box=Hive.box("notes");

  List<Widget> Pages = [NoteScreen(), FavouriteScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(AllIcons.addIcon, color: AllColors.whiteColor),
        backgroundColor: AllColors.brownColor,
        onPressed: () {
                _showAlertDialog(context);

        },
      ),
      bottomNavigationBar: GNav(
        curve: Curves.easeOutExpo, // tab animation curves
        gap: 7, // the tab button gap between icon and text
        color: AllColors.darkColor, // unselected icon color
        activeColor: AllColors.whiteColor, // selected icon and text color
        iconSize: 24, // tab button icon size
        // ignore: deprecated_member_use
        tabBackgroundColor: Colors
            .transparent, //withOpacity(0.9), // selected tab background color
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ), // navigation bar padding
        backgroundColor: AllColors.brownColor,
        selectedIndex: _currentIndex,
        onTabChange: (Value) {
          setState(() {
            _currentIndex = Value;
          });
        },
        tabs: [
          GButton(icon: AllIcons.noteIcon, text: 'Home'),
          GButton(icon: AllIcons.favouriteIcon, text: 'Favourites'),
        ],
      ),
      body: Pages[_currentIndex],
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text("Create a Note"),
              content: Column(
                children: [
                  TextField(
                    controller: _titleCtl,
                    decoration: InputDecoration(hintText: 'Enter a title'),
                  ),
                  TextField(
                    controller: _discriptionCtl,
                    decoration: InputDecoration(hintText: 'Enter the Discription'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                       _titleCtl.clear();
                    _discriptionCtl.clear();
                  },
                  child: Text('Cancle'),
                  style: TextButton.styleFrom(
                    backgroundColor: AllColors.redColor,
                    foregroundColor: AllColors.whiteColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final now_date=DateTime.now();
                    final df = new DateFormat('dd-MMM-yyyy hh:mm a');
                    final formatteddate=df.format(now_date);
                    controller.addNote(NoteModel(_titleCtl.text , _discriptionCtl.text, formatteddate));
                    Navigator.pop(context);
                   
                  },
                  child: Text('Save'),
                  style: TextButton.styleFrom(
                    backgroundColor: AllColors.brownColor,
                    foregroundColor: AllColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
