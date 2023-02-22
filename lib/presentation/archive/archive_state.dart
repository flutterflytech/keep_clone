part of 'archive_cubit.dart';


abstract class ArchiveState extends BaseState{
  final List<Notes> listOfArchivedBin;

  const ArchiveState(super.isLoading, super.errorMessage,this.listOfArchivedBin);
}

class ArchiveInitial extends ArchiveState {
  const ArchiveInitial(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}

class ArchiveLoaded extends ArchiveState {
  const ArchiveLoaded(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}


class ArchiveError extends ArchiveState {
  const ArchiveError(super.isLoading, super.errorMessage, super.listOfArchivedBin);

  @override
  List<Object?> get props => [isLoading,errorMessage,listOfArchivedBin];
}





