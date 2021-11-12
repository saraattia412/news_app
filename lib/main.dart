import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/welcom/welcome_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main()async
{
  //بيتاكد ان كل حاجه ف الميثود هنا خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();//import use with async

  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  bool?  isDark =CacheHelper.getBooleanData(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final bool? isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()
        ),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
    fromShared: isDark,),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,//عشان يشيل العلامه الحمرا ال فوق

            theme: ThemeData (
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,

              appBarTheme: const AppBarTheme(

                titleSpacing: 20,
                titleTextStyle:TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,

                ),
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
              ),
              tabBarTheme: const TabBarTheme(
                unselectedLabelColor: Colors.grey,
                labelColor:Colors.deepOrange ,
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),


            ),//light theme
            darkTheme: ThemeData(
              tabBarTheme: const TabBarTheme(
                unselectedLabelColor: Colors.grey,
                labelColor:Colors.deepOrange ,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme:  AppBarTheme(
                titleSpacing: 20,
                titleTextStyle:const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,

                ),
                iconTheme: const IconThemeData(
                    color: Colors.white
                ),
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              ),

            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,


            home:  const WelcomeScreen(),
          );
        },
      ),
    );
  }
}

