import 'package:bloc/bloc.dart';
import 'package:google_keep_advanced/base/base_state.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial(false,'',0));


  void onDrawerItemSelected(int pageIndex){
    emit(DashboardPageChangeState(state.isLoading, state.errorMessage, pageIndex));

  }
}
