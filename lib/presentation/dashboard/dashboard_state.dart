part of 'dashboard_cubit.dart';


abstract class DashboardState extends BaseState {
  final int currentPageIndex;
  const DashboardState(super.isLoading, super.errorMessage, this.currentPageIndex);
}

class DashboardInitial extends DashboardState {
  const DashboardInitial(super.isLoading, super.errorMessage, super.currentPageIndex);

  @override

  List<Object?> get props => [isLoading,errorMessage,currentPageIndex];
}

class DashboardPageChangeState extends DashboardState {
  const DashboardPageChangeState(super.isLoading, super.errorMessage, super.currentPageIndex);

  @override

  List<Object?> get props => [isLoading,errorMessage,currentPageIndex];
}




class DashboardError extends DashboardState {
  const DashboardError(super.isLoading, super.errorMessage, super.currentPageIndex);

  @override

  List<Object?> get props => [isLoading,errorMessage,currentPageIndex];
}

