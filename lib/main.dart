import 'package:app_project/config/extensions/extensions.dart';
import 'package:app_project/config/services/dio_helper.dart';
import 'package:app_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/dependencies/injection.dart';
import 'config/routes/routeGenerator.dart';
import 'core/style/app_theme.dart';
import 'view/home/form_screen.dart';
import 'view_model/auth/auth_cubit.dart';

void main() async {
  late Widget home;
  //s
  WidgetsFlutterBinding.ensureInitialized();

 // DioHelper.init(baseUrl: 'baseUrl');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configurationDependencies();
  await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform,
  ); 

  runApp(
  const  MyApp(
      home: FormScreen()
      // home,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            context.isDesktop ? const Size(1000, 800) : const Size(428, 926),
        fontSizeResolver: /* context.isDesktop
          ? (fontSize, instance) => FontSizeResolvers.width(fontSize, instance)
          : */
            (fontSize, instance) =>
                FontSizeResolvers.height(fontSize, instance),
        builder: (context, _) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'App',
              theme: AppTheme.defaultTheme,
              home: home,
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              //   initialRoute: AppRoutes.homeScreen,
            ),
          );
        });
  }
}
