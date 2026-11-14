// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/core/helpers/constans.dart';
import 'package:my_new_app/core/helpers/shared_pref_helper.dart';
import 'package:my_new_app/core/networking/api_constants.dart';
import 'package:my_new_app/core/networking/dio_factory.dart';
import 'package:my_new_app/features/login/data/models/login_request_body.dart';
import 'package:my_new_app/features/login/data/repos/login_repo.dart';
import 'package:my_new_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData?.token ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        final message = error.apiErrorModel.message;
        emit(
          LoginState.error(
            error: (message == null || message.isEmpty)
                ? ApiErrors.defaultError
                : message,
          ),
        );
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPreKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }
}
