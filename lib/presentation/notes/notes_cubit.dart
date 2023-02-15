import 'package:bloc/bloc.dart';
import 'package:google_keep_advanced/base/base_state.dart';
import 'package:hive/hive.dart';

import '../../classes/notes.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesInitial(false,'',[])){
    getSavedNotes();
  }


  void createNote(Notes note){
    List<Notes> list = [];
    list.addAll(state.listOfNotes);
    list.add(note);
    var box = Hive.box<Notes>('myNotes');
    box.add(note);


    emit(CreateNoteState(state.isLoading,state.errorMessage,list));
  }


  void getSavedNotes(){
    List<Notes> list = [];
    var box = Hive.box<Notes>('myNotes');
   list = box.values.toList();



    emit(NotesLoaded(state.isLoading,state.errorMessage,list));

  }

  void moveToBin(Notes note){
    //var currentBox = Hive.box<Notes>('myNotes');
   note.delete();

    var box = Hive.box<Notes>('deletedNotes');
    box.add(note);
   List<Notes> list = [];
   var mybox = Hive.box<Notes>('myNotes');
   list = mybox.values.toList();



   emit(NotesLoaded(state.isLoading,state.errorMessage,list));



  }

  void moveToArchive(Notes note){
    note.delete();

    var box = Hive.box<Notes>('archivedNotes');
    box.add(note);
    List<Notes> list = [];
    var myBox = Hive.box<Notes>('myNotes');
    list = myBox.values.toList();



    emit(NotesLoaded(state.isLoading,state.errorMessage,list));


  }

}
