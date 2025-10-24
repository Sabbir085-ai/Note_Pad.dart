// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_pad/controllers/note_controller.dart';
import 'package:note_pad/models/note_model.dart';
import 'package:note_pad/routes/routes.dart';
import 'package:note_pad/utils/all_colors.dart';
import 'package:note_pad/utils/all_icons.dart';

class NoteScreen extends StatelessWidget {
  //normal object

  NoteScreen({super.key});

//NoteController controller=NoteController();

  NoteController controller=Get.put(NoteController()); //Getx Based object
  TextEditingController _titleCtl = TextEditingController();
  TextEditingController _discriptionCtl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(AllIcons.backIcon,color: AllColors.whiteColor),
        title: Text("Note",style: TextStyle(color: AllColors.whiteColor),),
        backgroundColor: AllColors.brownColor,
        actions: [Icon(AllIcons.moreIcon,color: AllColors.whiteColor,)],
      ),
      body: SizedBox(
        width: Get.width,
        child: GetBuilder<NoteController>(builder: (_){
          return controller.notes.isEmpty? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //Icon(AllIcons.emptyIcon),
            //SizedBox(height: 5.0,),
            Text("Note is empty"),
          ]): ListView.builder(
            itemCount: controller.notes.length,
            itemBuilder: (context,index){
              NoteModel note=controller.notes[index];
              return ListTile(
                title: Text(note.title),
                 subtitle:Text(note.discription),
                 trailing: SizedBox(width: 60,
                 child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        _titleCtl.text=note.title;
                        _discriptionCtl.text=note.discription;
                        _showAlertDialog(context, index);
                      },
                      child: Icon(AllIcons.editIcon)),
                      InkWell(
                      onTap: (){
                        controller.deleteNote(index);
                      },
                      child: Icon(AllIcons.deleteIcon,)),
                  ],
                 ),
                 ),
                 onTap: (){
                  Get.toNamed(RouteName.note_details,arguments: {
                    'note':note});
                 },
              );
            }
            );
        }),
      ),
    );
  }
  void _showAlertDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Text("Update Note"),
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
                    controller.updateNote(index, NoteModel(_titleCtl.text , _discriptionCtl.text, formatteddate));
                    Navigator.pop(context);
                    
                    _titleCtl.clear();
                     _discriptionCtl.clear();

                  },
                  child: Text('Update'),
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