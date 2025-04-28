import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/Entities/SignUpEntity.dart';
import '../Reprositories/signInRepo.dart';

@Injectable()
class SignInUsecase {
  SignInRepo signInRepo;
  SignInUsecase(this.signInRepo);
  @factoryMethod
  Future<Either<String,SignUpEntity>>call({required String phone , required String password})=>signInRepo.login(phone_number: phone, password: password);

}