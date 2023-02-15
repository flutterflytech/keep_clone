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
    List<Notes> list = [];
    var box = Hive.box<Notes>('archivedNotes');
    list = box.values.toList();
    emit(ArchiveLoaded(state.isLoading, state.errorMessage, list));
  }


}


