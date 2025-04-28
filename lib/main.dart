/*
import 'package:flutter/material.dart';

import 'core/DI/di.dart';
import 'core/cashe/prefs_handler.dart';
import 'my_app.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsHandler.init();
  runApp(const MyApp());
}


*/

// import 'package:flutter/material.dart';
// import 'package:savvyflos/core/DI/di.dart';
// import 'package:savvyflos/core/cashe/prefs_handler.dart';
// import 'package:savvyflos/my_app.dart';
//
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   configureDependencies();
//   await PrefsHandler.init();
//   runApp(const MyApp());
//}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:talkable_2/presentation/screens/educationScreen/data/datasource/video_dataSource.dart';
import 'package:talkable_2/presentation/screens/educationScreen/data/repositoryimpl/video_repo.dart';
import 'package:talkable_2/presentation/screens/educationScreen/domain/usecase/get_videos_usecase.dart';
import 'package:talkable_2/presentation/screens/educationScreen/presentation/video_view_model.dart';
import 'package:talkable_2/presentation/screens/splash/splash_screen.dart';
import 'package:talkable_2/presentation/screens/translationScreen/translate_manager/translate_manager_cubit.dart';
import 'core/DI/di.dart';
import 'core/cashe/prefs_handler.dart';
import 'core/utils/routes_manager.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await PrefsHandler.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VideoViewModel(
            getVideosUseCase: GetVideosUseCase(
              VideoRepositoryImpl(VideoRemoteDataSource()),
            ),
          ),
        ),
        BlocProvider(
        create: (_) => TranslateManagerCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,
        initialRoute:RoutesManager.splash ,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        //home: SplashScreen(),
        //home: EducationScreen(),
      ),
    );
  }
}