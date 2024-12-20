// ignore_for_file: use_key_in_widget_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled6/NEWSapp/cubitnews.dart';
import 'package:untitled6/Shop_App/Home_screen.dart';
import 'package:untitled6/shared/Bloc_observer.dart';
import 'package:untitled6/shared/network/local/shared_preference.dart';
import 'package:untitled6/shared/network/remote/DIOhelper.dart';
import 'NEWSapp/sccafoledscreen.dart';
import 'NEWSapp/states.dart';
import 'Shop_App/Shop_Onboarding.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  cacheHelper.init() ;
  cachehelper1.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => newscubit(),
        child: BlocBuilder<newscubit,newsState>(
            builder: (context,state){
return
    MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
        primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(

    iconTheme: IconThemeData(
    color: Colors.white
    ),
    backgroundColor: Colors.white,
    titleTextStyle:TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23,
    ) ,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark ,
    ),
    ),
    scaffoldBackgroundColor:Colors.white,
    textTheme: TextTheme(
    ),
       // fontFamily: 'Janna',

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor:Colors.white,
    elevation: 0,
    selectedItemColor: Colors.black ,
    unselectedItemColor: Colors.grey,
    ),
    ),
    darkTheme: ThemeData(
    appBarTheme: AppBarTheme(
    actionsIconTheme : IconThemeData(
    size: 35,
    color: Colors.white,
    ) ,
    backgroundColor: HexColor('333739'),
    titleTextStyle:TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23,

    ) ,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light ,
    ),
    elevation: 40,
    ),
    scaffoldBackgroundColor:HexColor('333739'),
    textTheme:TextTheme(
    bodyMedium: TextStyle(
    color: Colors.white,
    )

    ) ,
   // fontFamily: 'Janna',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor:HexColor('333739'),
    elevation: 0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,


    ),
    ),
    themeMode:newscubit.get(context).isdark ?ThemeMode.dark:ThemeMode.light,
    home: HomeScreen (),
    );

    },
    )
    );
  }
}