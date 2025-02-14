import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evaluation/common/constants/routes.dart';
import 'package:evaluation/common/injection/user_injection_container.dart';
import 'package:evaluation/features/base/data/helpers/base_state.dart';
import 'package:evaluation/features/base/presentation/view_models/base_view_model.dart';
import 'package:evaluation/features/user_auth/data/models/check_human_model.dart';
import 'package:evaluation/features/user_auth/data/models/login_model.dart';
import 'package:evaluation/features/user_auth/data/models/register_sent_model.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/check_human_usecase.dart';
import 'package:evaluation/features/user_auth/domain/use_cases/register_usecase.dart';
import 'package:evaluation/features/user_auth/presentation/global_states/register_state.dart';
import 'package:evaluation/features/user_auth/presentation/helpers/mixins/register_validator_mixin.dart';
import 'package:image/image.dart' as img;

class RegisterViewModel extends StateNotifier<BaseState<RegisterState>>
    with RegisterValidatorMixin, BaseViewModel {
  final RegisterUsecase _registerUsecase;
  final CheckHumanUsecase _checkHumanUsecase;

  RegisterViewModel(
      {required RegisterUsecase registerUsecase,
      required CheckHumanUsecase checkHumanUsecase})
      : _registerUsecase = registerUsecase,
        _checkHumanUsecase = checkHumanUsecase,
        super(BaseState(data: RegisterState(errors: [])));

  Future<LoginModel?> register({required RegisterSentModel data}) async {
    hideKeyboard();
    state = state.copyWith(
        data: state.data.copyWith(
            errors: validateRegisterField(
                firstName: data.firstName,
                lastName: data.lastName,
                fullName: data.fullName,
                email: data.email,
                phoneNo: data.phoneNumber,
                password: data.password,
                referancePhoto: data.referancePhoto,
                companyExtention: data.companyExtention)));

    if (state.data.errors.isNotEmpty) return null;

    state = state.copyWith(isLoading: true);
    final response = await _registerUsecase(data: data);
    state = state.copyWith(isLoading: false);
    return response.fold((user) {
      Routes.navigatorKey.providerScope
          ?.read(userProvider.notifier)
          .setLocalUserProfile(user);
      return user;
    }, (error) {
      handleError(error: error);
      return null;
    });
  }

  Future<CheckHumanModel?> checkHuman({required FormData data}) async {
    hideKeyboard();
    state = state.copyWith(isLoading: true);
    final response = await _checkHumanUsecase(data: data);
    state = state.copyWith(isLoading: false);
    return response.fold((model) {
      return model;
    }, (error) {
      handleError(error: error);
      return null;
    });
  }

  // Helper function to compress the image
  Future<File> compressImage(File file) async {
    final imageBytes = await file.readAsBytes();
    final decodedImage = img.decodeImage(imageBytes);
    if (decodedImage == null) {
      throw Exception('Could not decode image');
    }
    final resizedImage = img.copyResize(decodedImage, width: 200);
    final compressedImage = File(file.path)
      ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 50));

    return compressedImage;
  }
}
