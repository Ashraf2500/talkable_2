part of 'translate_manager_cubit.dart';

abstract class TranslateManagerState extends Equatable {
  const TranslateManagerState();

  @override
  List<Object?> get props => [];
}

class TranslateInitial extends TranslateManagerState {}

class TranslateLoading extends TranslateManagerState {}

class TranslateSuccess extends TranslateManagerState {
  final List<SignVideo> signVideos;

  const TranslateSuccess(this.signVideos);

  @override
  List<Object?> get props => [signVideos];
}

class TranslateError extends TranslateManagerState {
  final String message;

  const TranslateError(this.message);

  @override
  List<Object?> get props => [message];
}
