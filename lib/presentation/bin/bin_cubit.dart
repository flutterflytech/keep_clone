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
    List<Notes> list = [];
    var box = Hive.box<Notes>('deletedNotes');
    list = box.values.toList();
    emit(BinLoaded(state.isLoading, state.errorMessage, list));
  }
}
