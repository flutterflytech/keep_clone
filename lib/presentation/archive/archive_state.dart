part of 'archive_cubit.dart';


abstract class ArchiveState extends BaseState{
  List<Notes> listOfArchivedBin;

  ArchiveState(super.isLoading, super.errorMessage,this.listOfArchivedBin);
}

class ArchiveInitial extends ArchiveState {
  ArchiveInitial(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}

class ArchiveLoaded extends ArchiveState {
  ArchiveLoaded(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}


class ArchiveError extends ArchiveState {
  ArchiveError(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}





