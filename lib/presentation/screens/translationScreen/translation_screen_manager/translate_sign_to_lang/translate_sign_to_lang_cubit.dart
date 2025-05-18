
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:talkable_2/core/utils/strings_manager.dart';
part 'translate_sign_to_lang_state.dart';



class DetectSignCubit extends Cubit<DetectSignState> {
  DetectSignCubit() : super(DetectSignInitial());

  Future<void> detectSignImage({
    required File imageFile,
    required String language,
  }) async {
    emit(DetectSignLoading());

    try {
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse('${StringsManager.baseUrl}/detect_sign'), // غيّر الرابط حسب السيرفر بتاعك
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "image": base64Image,
          "language": language,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final gesture = data["gesture"];
        final videoUrl = data["video"];
        emit(DetectSignSuccess(gesture: gesture, videoUrl: videoUrl));
      } else {
        final error = jsonDecode(response.body)["error"];
        emit(DetectSignError(error));
      }
    } catch (e) {
      emit(DetectSignError("حدث خطأ أثناء تحليل الصورة: $e"));
    }
  }
}
