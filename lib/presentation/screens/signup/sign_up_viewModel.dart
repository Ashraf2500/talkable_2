//
// import 'package:savvyflos/domain/usecases/signUpUseCase.dart';
//
// @injectable
//
// class SignUpViewModel extends Cubit<SignUpState>{
// @factoryMethod SignUpViewModel({required this.SignUpUseCase}):super(SignUpLoadingState());
// signUpUseCase SignUpUseCase;
// void SignUp({required String name , required String email , required String phone , required String password,
//   required String rePassword})async{
//
//   var result = await SignUpUseCase.execute(name: name,
//        email: email,
//        phone: phone,
//        password: password,
//        rePassword: password);
//
//   switch(result) {
//
//     case Success<SignUpEntity>():
//         emit(SignUpSuccessState(signUpEntity: result.data));
//     case ServerError<SignUpEntity>():
//         emit(SignUpErrorState(exception: result.serverException));
//      case Error<SignUpEntity>():
//          emit (SignUpErrorState(exception:result.exception));
//
//   }
//
// }
// }
//
//
// sealed class SignUpState{}
//
// class SignUpInitialState extends SignUpState {}
//
// class SignUpSuccessState extends SignUpState {
//
//   SignUpEntity signUpEntity;
//
//   SignUpSuccessState({required this.signUpEntity});
//
// }
//
//
//
// class  SignUpLoadingState extends SignUpState {
//
//   String? loadingMessage;
//
//   SignUpLoadingState({required this.loadingMessage});
//
// }
//
//
// class SignUpErrorState extends SignUpState{
//
//   Exception exception;
//
//   SignUpErrorState({required this.exception});
//
//
//
// }