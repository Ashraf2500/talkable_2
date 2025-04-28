part of 'sign_up_view_model_cubit.dart';

@immutable
sealed class SignUpViewModelState {}

final class SignUpViewModelInitial extends SignUpViewModelState {}

class loadingState extends SignUpViewModelState{}

class ErrorState extends SignUpViewModelState{

  String error;
  ErrorState(this.error);

}

class SuccessState extends SignUpViewModelState{
  SignUpEntity entity;
  SuccessState(this.entity);
}