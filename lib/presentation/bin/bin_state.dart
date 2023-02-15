part of 'bin_cubit.dart';


abstract class BinState extends BaseState {
  List<Notes> listOfDeletedBin;
  BinState(super.isLoading, super.errorMessage,this.listOfDeletedBin);

}

class BinInitial extends BinState {
  BinInitial(super.isLoading, super.errorMessage, super.listOfDeletedBin);

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,errorMessage,listOfDeletedBin];
}


class BinError extends BinState {
  BinError(super.isLoading, super.errorMessage, super.listOfDeletedBin);

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,errorMessage,listOfDeletedBin];
}

class BinLoaded extends BinState {
  BinLoaded(super.isLoading, super.errorMessage, super.listOfDeletedBin);

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading,errorMessage,listOfDeletedBin];
}
