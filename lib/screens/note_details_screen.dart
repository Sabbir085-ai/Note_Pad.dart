import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';
import 'package:note_pad/utils/all_sizes.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    NoteModel note = Get.arguments['note'];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(AllIcons.backIcon, color: AllColors.whiteColor),
        ),

        title: Text(
          "Note Details",
          style: TextStyle(color: AllColors.whiteColor),
        ),
        actions: [
          Icon(AllIcons.favouriteIcon, color: AllColors.whiteColor),
          SizedBox(width: 10.0),
          Icon(AllIcons.copyIcon, color: AllColors.whiteColor),
          SizedBox(width: 10.0),
          Icon(AllIcons.shareIcon, color: AllColors.whiteColor),
          SizedBox(width: 10.0),
        ],
        backgroundColor: AllColors.brownColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: TextStyle(
              fontSize: AllSizes.LargeSizes,
              // ignore: deprecated_member_use
              color: AllColors.darkColor.withOpacity(0.8),
            ),
          ),
          Text('Created at ${note.date}',
            style: TextStyle(
              fontSize: AllSizes.SmallSize,
              // ignore: deprecated_member_use
              color: AllColors.darkColor.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 20.0,),
          Text(note.discription,
            style: TextStyle(
              fontSize: AllSizes.MediumSize,
              // ignore: deprecated_member_use
              color: AllColors.darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
