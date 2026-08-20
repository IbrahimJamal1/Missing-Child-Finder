import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_cubit_state.dart';

class CommentCubitCubit extends Cubit<CommentCubitState> {
  CommentCubitCubit() : super(CommentCubitInitial());
}
