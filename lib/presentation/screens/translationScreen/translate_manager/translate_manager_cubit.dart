import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/strings_manager.dart';
import '../Translate_model/Sign_video.dart';

part 'translate_manager_state.dart';

class TranslateManagerCubit extends Cubit<TranslateManagerState> {
  TranslateManagerCubit() : super(TranslateInitial());

  Future<void> translateText({required String language, required String text}) async {
    emit(TranslateLoading());
    try {
      final response = await Dio().post(
        '${StringsManager.baseUrl}/get_sign_images',
        data: {
          "language": language,
          "text": text,
        },
      );

      final data = response.data;

      print("ashraf : data of videos ${data}");

      if (data.containsKey('sign_videos')) {
        final signVideos = (data['sign_videos'] as List)
            .map((e) => SignVideo.fromJson(e))
            .toList();
        emit(TranslateSuccess(signVideos));
      } else {
        emit(TranslateError('Unexpected response format'));
      }
    } catch (e) {
      emit(TranslateError(e.toString()));
    }
  }
}