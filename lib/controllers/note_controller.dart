import 'package:get/get.dart';
import 'package:note_pad/models/note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [];

  void addNote(NoteModel note) {
    notes.add(note);
    update();
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    update();
  }
  void updateNote(int index, NoteModel note){
    notes[index]=note;
    update();
  }
}
