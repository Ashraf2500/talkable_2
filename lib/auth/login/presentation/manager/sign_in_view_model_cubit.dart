import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/Entities/SignUpEntity.dart';
import '../../domain/usecases/SignInUsecase.dart';

part 'sign_in_view_model_state.dart';

@Injectable()
class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  @factoryMethod
  SignInViewModelCubit(this.signInUsecase) : super(SignInViewModelInitial());

  static SignInViewModelCubit get(BuildContext context) =>
      BlocProvider.of(context);
  SignInUsecase signInUsecase;

  login(String phonenumber, String password) async {
    emit(LoadingState());
    var result = await signInUsecase.call(
      phone: phonenumber,
      password: password,
    );
    print("ashraf Cubit result :$result");

    result.fold(
       (error) {
        print("ashraf Cubit error");
        emit(ErrorState(error));
      },
      (signInEntity) {
        emit(SuccessState(signInEntity));
      },
    );
  }
}
