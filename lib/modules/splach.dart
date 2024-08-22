import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/cubit/cubit.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';
import 'package:weather_app_bloc_cubit/main.dart';

import '../compants/widgets.dart';

class SplachScreen extends StatelessWidget {
   SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
    listener: (BuildContext context, WeatherStates state) {
      if(state is WeatherGetHomeSuccessState)
        WeatherCubit.get(context).AfterSplach(context);


    },
    builder: (BuildContext context, WeatherStates state) {
      var cubit= WeatherCubit.get(context);

      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height*0.9999,
      decoration: BoxDecoration(
      image: DecorationImage(
      image: ExactAssetImage( getWeatherImages(cubit.weather?.description,cubit.isDark)),
          opacity: 0.8,// because if you want a transparent navigation bar I assume that you have either a background image or a background color. You need to add the image you want and also authorize it in pubspec.yaml
          fit: BoxFit.cover)),
          child: Padding(

            padding:  EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: ExactAssetImage('aseets/images/logo.png'),
                            fit: BoxFit.contain)),

                  ),
                  SizedBox(height: 20,),
                  CircularProgressIndicator(color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      );

    },);
  }
}
