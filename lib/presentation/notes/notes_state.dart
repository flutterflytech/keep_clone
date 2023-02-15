part of 'notes_cubit.dart';


abstract class NotesState extends BaseState {
  final List<Notes> listOfNotes;
  const NotesState(super.isLoading, super.errorMessage,this.listOfNotes);
}

class NotesInitial extends NotesState {
  const NotesInitial(super.isLoading, super.errorMessage, super.listOfNotes);

  @override

  List<Object?> get props => [isLoading,errorMessage,listOfNotes];
}

class NotesLoaded extends NotesState {
  const NotesLoaded(super.isLoading, super.errorMessage, super.listOfNotes);

  @override

  List<Object?> get props => [isLoading,errorMessage,listOfNotes];
}



class CreateNoteState extends NotesState {
  const CreateNoteState(super.isLoading, super.errorMessage, super.listOfNotes);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfNotes];
}



