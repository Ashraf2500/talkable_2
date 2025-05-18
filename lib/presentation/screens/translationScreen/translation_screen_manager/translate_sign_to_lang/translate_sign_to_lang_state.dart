part of 'translate_sign_to_lang_cubit.dart';

abstract class DetectSignState extends Equatable {
  const DetectSignState();

  @override
  List<Object?> get props => [];
}

class DetectSignInitial extends DetectSignState {}

class DetectSignLoading extends DetectSignState {}

class DetectSignSuccess extends DetectSignState {
  final String gesture;
  final String? videoUrl;

  const DetectSignSuccess({required this.gesture, this.videoUrl});

  @override
  List<Object?> get props => [gesture, videoUrl];
}

class DetectSignError extends DetectSignState {
  final String error;

  const DetectSignError(this.error);

  @override
  List<Object?> get props => [error];
}
