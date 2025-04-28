/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkable_2/presentation/screens/educationScreen/data/datasource/video_dataSource.dart';
import 'package:talkable_2/presentation/screens/educationScreen/data/repositoryimpl/video_repo.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';
import 'package:talkable_2/presentation/screens/educationScreen/presentation/video_view_model.dart';
import 'package:talkable_2/presentation/screens/translationScreen/translate_manager/translate_manager_cubit.dart';
import 'package:provider/provider.dart';
import 'core/utils/routes_manager.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (_) => TranslateManagerCubit(),
        ),
        ChangeNotifierProvider(
          create: (_) => VideoViewModel(
            getVideosUseCase: GetVideosUseCase(
              VideoRepositoryImpl(VideoRemoteDataSource()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute:RoutesManager.splash ,
        //PrefsHandler.getToken().isNotEmpty?RoutesManager.home:RoutesManager.login,
       // theme: AppTheme.light,
        //themeMode: ThemeMode.light,
      ),
    );
  }
}
*/



