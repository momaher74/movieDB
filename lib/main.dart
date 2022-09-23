import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listenerrrr/cubit/app_cubit.dart';
import 'package:listenerrrr/homescreen.dart';

import 'network/remote.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized() ;
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context)=>AppCubit()..getTopRated()..getTrendRated(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            darkTheme:ThemeData(
              textTheme: const TextTheme(
                titleLarge: TextStyle(color: Colors.white)
              ),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                  color: Colors.black ,
                  elevation: 2.5,
                )
            ),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.white ,
                elevation: 1 ,
              )
            ),
            home: const HomeScreen(),
          ) ;
        },
      ),
    );
  }
}


