import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'publish_cubit_state.dart';

class PublishCubitCubit extends Cubit<PublishCubitState> {
  PublishCubitCubit() : super(PublishCubitInitial());
}
