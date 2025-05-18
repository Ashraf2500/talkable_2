import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_detection_state.dart';

class SignDetectionCubit extends Cubit<SignDetectionState> {
  SignDetectionCubit() : super(SignDetectionState(recognizedText: ""));

  void updateText(String newText) {
    emit(SignDetectionState(recognizedText: newText));
  }
}