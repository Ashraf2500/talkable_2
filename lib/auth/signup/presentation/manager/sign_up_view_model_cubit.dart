import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/Entities/SignUpEntity.dart' show SignUpEntity;
import '../../../../domain/usecases/signUpUseCase.dart';

part 'sign_up_view_model_state.dart';
@injectable
class SignUpViewModelCubit extends Cubit<SignUpViewModelState> {
  @factoryMethod
  SignUpViewModelCubit(this.SignUpUseCase) : super(SignUpViewModelInitial());


  signUpUseCase SignUpUseCase;
  signUp({required String name, required String phone_number, required String address, required String password, required String user_type})async{
    emit(loadingState());
   var result = await  SignUpUseCase.call(name: name, phone_number: phone_number, address: address, password: password, user_type: user_type);

   result.fold((SignUpEntity){

     emit(SuccessState(SignUpEntity));
  },(error){
     emit(ErrorState(error));

   });
}}
