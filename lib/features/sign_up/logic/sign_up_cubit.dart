import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/core/helpers/constans.dart';
import 'package:my_new_app/core/helpers/shared_pref_helper.dart';
import 'package:my_new_app/core/networking/api_constants.dart';
import 'package:my_new_app/core/networking/dio_factory.dart';
import 'package:my_new_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:my_new_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:my_new_app/features/sign_up/logic/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    if (formKey.currentState!.validate()) {
      emit(const SignupState.signupLoading());
      final response = await _signupRepo.signup(
        SignupRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text,
          gender: 0,
        ),
      );
      response.when(
        success: (signupResponse) async {
          await saveUserToken(signupResponse.userData?.token ?? '');
          emit(SignupState.signupSuccess(signupResponse));
        },
        failure: (error) {
          final message = error.apiErrorModel.message;
          emit(
            SignupState.signupError(
              error: (message == null || message.isEmpty)
                  ? ApiErrors.defaultError
                  : message,
            ),
          );
        },
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPreKeys.userToken, token);
    DioFactory.setTokenAfterLogin(token);
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
