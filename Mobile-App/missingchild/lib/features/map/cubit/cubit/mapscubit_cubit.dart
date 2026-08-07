import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mapscubit_state.dart';

class MapscubitCubit extends Cubit<MapscubitState> {
  MapscubitCubit() : super(MapscubitInitial());
}
