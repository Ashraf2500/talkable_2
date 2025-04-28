// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talkable_2/auth/login/data/data_sources/DaoImpl/SignInApimpl.dart'
    as _i423;
import 'package:talkable_2/auth/login/data/data_sources/SignInDao.dart'
    as _i193;
import 'package:talkable_2/auth/login/data/Repositories/SignInRepoimpl.dart'
    as _i704;
import 'package:talkable_2/auth/login/domain/Reprositories/signInRepo.dart'
    as _i702;
import 'package:talkable_2/auth/login/domain/usecases/SignInUsecase.dart'
    as _i706;
import 'package:talkable_2/auth/login/presentation/manager/sign_in_view_model_cubit.dart'
    as _i225;
import 'package:talkable_2/auth/signup/data/data_sourses/SignDaoApiimpl/SignDaoApiimpl.dart'
    as _i406;
import 'package:talkable_2/auth/signup/data/data_sourses/SignUpDao.dart'
    as _i583;
import 'package:talkable_2/auth/signup/presentation/manager/sign_up_view_model_cubit.dart'
    as _i722;
import 'package:talkable_2/core/endpoints/apiManager.dart' as _i525;
import 'package:talkable_2/core/remote/ApiManager.dart' as _i439;
import 'package:talkable_2/data/repo_impl/signUpRepo_impl.dart' as _i943;
import 'package:talkable_2/domain/repo/SignUpRepo.dart' as _i594;
import 'package:talkable_2/domain/usecases/signUpUseCase.dart' as _i533;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i439.ApiManager>(() => _i439.ApiManager());
    gh.factory<_i583.SignUpDao>(
      () => _i406.SignDaoApiimpl(gh<_i439.ApiManager>()),
    );
    gh.factory<_i193.SignInDao>(
      () => _i423.SignInApimpl(gh<_i439.ApiManager>()),
    );
    gh.factory<_i594.SignUpRepo>(
      () => _i943.signUpRepoImpl(gh<_i583.SignUpDao>()),
    );
    gh.factory<_i702.SignInRepo>(
      () => _i704.SignInRepoImpl(gh<_i193.SignInDao>()),
    );
    gh.factory<_i533.signUpUseCase>(
      () => _i533.signUpUseCase(signUpRepo: gh<_i594.SignUpRepo>()),
    );
    gh.factory<_i706.SignInUsecase>(
      () => _i706.SignInUsecase(gh<_i702.SignInRepo>()),
    );
    gh.factory<_i225.SignInViewModelCubit>(
      () => _i225.SignInViewModelCubit(gh<_i706.SignInUsecase>()),
    );
    gh.factory<_i722.SignUpViewModelCubit>(
      () => _i722.SignUpViewModelCubit(gh<_i533.signUpUseCase>()),
    );
    return this;
  }
}
