import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/compants/local_not.dart';
import 'package:weather_app_bloc_cubit/cubit/cubit.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';
import 'package:weather_app_bloc_cubit/modules/splach.dart';
import 'package:weather_app_bloc_cubit/styles/themes.dart';

import 'cubit/bloc_observer.dart';
import 'network/local/cacheHelper.dart';
import 'network/remote/dio_helper.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;



void main()async {
  WidgetsFlutterBinding.ensureInitialized();



  bool isDark = CacheHelper.getData(key: 'isDark')??true;
  print(isDark);




  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  await LocalNotifications.init();

  tz.initializeTimeZones();








  runApp( MyApp(isdark: isDark,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.isdark});
   final  bool isdark;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getCurrentCity()..getHomeWeather()..getHomeForecast(),
      child: BlocConsumer<WeatherCubit,WeatherStates>(listener: (BuildContext context, WeatherStates state) {  },
        builder: (BuildContext context, WeatherStates state) {
        var cubit =WeatherCubit.get(context);
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark  ?  ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:  SplachScreen(),
          );

        },

      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {






  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(listener: (BuildContext context, WeatherStates state) {  },
      builder: (BuildContext context, WeatherStates state) {

      var cubit = WeatherCubit.get(context);
      return  Scaffold(
        resizeToAvoidBottomInset: false, // Prevent overflow caused by the keyboard




        body: SafeArea(child: cubit.bottomScreens[cubit.currentIndex]),
        bottomNavigationBar:  BottomNavigationBar(




            currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          }
          ,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          //  BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Reminder')
        ],),

        );
    },
    );
  }





}
