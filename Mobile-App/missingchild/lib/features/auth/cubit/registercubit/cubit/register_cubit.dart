import 'package:ai_safetrack/core/api/api_exception.dart';
import 'package:ai_safetrack/features/auth/models/registermodel.dart';
import 'package:ai_safetrack/features/auth/repository/registerrequest.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Registerrequest registerrequest;

  RegisterCubit(this.registerrequest) : super(RegisterInitial());

  Future<void> login(Registermodel model) async {
    emit(RegisterLoading());

    try {
      final response = await registerrequest.register(model);
      
      emit(RegisterSuccess(response));
    } on ApiException catch (e) {
      emit(RegisterError(e.message));
    } catch (e) {
      print(e);
      emit(RegisterError(e.toString()));
    }
  }
}
