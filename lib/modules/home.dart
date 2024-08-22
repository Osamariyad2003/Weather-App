import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/compants/local_not.dart';
import 'package:weather_app_bloc_cubit/cubit/cubit.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';

import '../compants/pages.dart';
import '../compants/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (BuildContext context, WeatherStates state) {

        if(state is WeatherMainScreenState)
          LocalNotifications.showScheduleNotification(id: -1, title: 'Weather Reminder', body: '', payload: '');




      },
      builder: (BuildContext context, WeatherStates state) {
      var cubit = WeatherCubit.get(context);
        return ConditionalBuilder(condition: cubit.weather != null && cubit.hours!=null  , builder: (context ) =>
                            Container(
                              height: MediaQuery.of(context).size.height*0.9999,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: ExactAssetImage( getWeatherImages(cubit.weather?.description,cubit.isDark)),
                                      opacity: 0.9,// because if you want a transparent navigation bar I assume that you have either a background image or a background color. You need to add the image you want and also authorize it in pubspec.yaml
                                      fit: BoxFit.cover
                                  ),),
                                child: buildHome( cubit.hours,cubit.h,cubit.weather,cubit.currentAddress,context,cubit.isDark,cubit))

            , fallback:(context)
        => Center(child: CircularProgressIndicator()));
      },);
  }
}
