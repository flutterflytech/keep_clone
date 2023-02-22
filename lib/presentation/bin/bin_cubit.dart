import 'package:bloc/bloc.dart';
import 'package:google_keep_advanced/base/base_state.dart';
import 'package:hive/hive.dart';
import '../../classes/notes.dart';

part 'bin_state.dart';

class BinCubit extends Cubit<BinState> {
  BinCubit() : super(BinInitial(false,'',[])){
    getDeletedList();
  }

 void  getDeletedList(){

    emit(BinLoaded(state.isLoading, state.errorMessage, getList()));
  }



  void deletePermanent(Notes note){

    note.delete();

    emit(BinLoaded(state.isLoading, state.errorMessage, getList()));


  }

  void restoreNote(Notes note){
    note.delete();

    var box = Hive.box<Notes>('myNotes');
    box.add(note);

    emit(BinLoaded(state.isLoading, state.errorMessage, getList()));


  }

  void cleanBin(){
    var box = Hive.box<Notes>('deletedNotes');
    box.deleteAll(box.keys);
    emit(BinLoaded(state.isLoading, state.errorMessage, getList()));
  }


  List<Notes> getList(){
    List<Notes> list = [];
    var box = Hive.box<Notes>('deletedNotes');
    list = box.values.toList();
    return list;
  }
}
