import 'package:bloc/bloc.dart';
import 'package:google_keep_advanced/base/base_state.dart';
import 'package:hive/hive.dart';
import '../../classes/notes.dart';

part 'archive_state.dart';

class ArchiveCubit extends Cubit<ArchiveState> {
  ArchiveCubit() : super(ArchiveInitial(false,'',[])){
    getArchivedNotes();
  }

  void getArchivedNotes(){

    emit(ArchiveLoaded(state.isLoading, state.errorMessage, getList()));
  }

  void unarchiveNotes(Notes note){
    note.delete();

    var box = Hive.box<Notes>('myNotes');
    box.add(note);
    emit(ArchiveLoaded(state.isLoading, state.errorMessage, getList()));


  }

  List<Notes> getList(){
    List<Notes> list = [];
    var box = Hive.box<Notes>('archivedNotes');
    list = box.values.toList();
    return list;

  }


}


