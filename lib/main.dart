import 'package:chef_upp/data/service/recipe/recipe_service.dart';
import 'package:chef_upp/features/constant/color_constant.dart';
import 'package:chef_upp/features/init/network/dio_manager.dart';
import 'package:chef_upp/features/init/routes/router.gr.dart';
import 'package:chef_upp/view/recipe/recipe_information/bloc/recipe_information_bloc.dart';
import 'package:chef_upp/view/recipe/recipe_search/bloc/recipe_search_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final networkManager = DioManager.instance.networkManager;
  final recipeService = RecipeService(networkManager);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RecipeSearchBloc(recipeService),
      ),
      BlocProvider(
        create: (context) => RecipeInformationBloc(recipeService),
      ),
    ],
    child: const ChefUppApp(),
  ));
}

class ChefUppApp extends StatelessWidget {
  const ChefUppApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final _appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: ColorConstant.title,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
