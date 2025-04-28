part of 'sign_in_view_model_cubit.dart';

@immutable
sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
class LoadingState extends SignInViewModelState{}
class ErrorState extends SignInViewModelState{
  String error;
  ErrorState(this.error);
}
class SuccessState extends SignInViewModelState{
  SignUpEntity signUpEntity;
  SuccessState(this.signUpEntity);
}
