import 'package:ai_safetrack/core/api/api_exception.dart';
import 'package:ai_safetrack/core/api/storagetoken.dart';
import 'package:ai_safetrack/features/auth/models/loginmodel.dart';
import 'package:ai_safetrack/features/auth/repository/loginrequest.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Loginrequest loginrequest;

  LoginCubit(this.loginrequest) : super(LoginInitial());

  Future<void> login(Loginmodule model) async {
    emit(LoginLoading());

    try {
      final response = await loginrequest.login(model);

      final token = response["data"]["token"];
      await TokenStorage.saveToken(token);
      print(token);
      emit(LoginSuccess(response));
    } on ApiException catch (e) {
      emit(LoginError(e.message));
    } catch (e) {
      print(e);
      emit(LoginError(e.toString()));
    }
  }
}
