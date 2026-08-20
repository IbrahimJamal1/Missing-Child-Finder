import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_cubit_state.dart';

class ReportCubitCubit extends Cubit<ReportCubitState> {
  ReportCubitCubit() : super(ReportCubitInitial());
}
