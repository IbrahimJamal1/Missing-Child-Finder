import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feedback_cubit_state.dart';

class FeedbackCubitCubit extends Cubit<FeedbackCubitState> {
  FeedbackCubitCubit() : super(FeedbackCubitInitial());
}
