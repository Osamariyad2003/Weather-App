import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_cubit/models/hours.dart';
import 'package:weather_app_bloc_cubit/models/weather.dart';
import 'package:weather_icons/weather_icons.dart';

import '../styles/colors.dart';
import 'widgets.dart';

Widget buildSearch(Hours? he,List<ListHours> hour,Weather? w,String? position,BuildContext context,bool isdark) => SingleChildScrollView(

  child: Padding(

    padding:  EdgeInsets.all(20),

    child: Center(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),

          BigCard(w: w, assetName: getWeatherImages(w?.description,isdark), context: context, position: position),
          SizedBox(height: 10,),
          ClothesCard(context: context,isdark: isdark,Path: getWeatherClothes(w?.temp ?? 30, isdark)?? '',title: getClothesDespription(w!.temp)),
          SizedBox(height: 10,),
          Center(

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  MedCard(context: context, weather: w, title: 'Max Temp',isdark: isdark, weatherIcons:Icon(Icons.device_thermostat_outlined)),
                  SizedBox(width: 15,),
                  MedCard(context: context, weather: w, title: 'humidity',isdark: isdark, weatherIcons:Icon(WeatherIcons.humidity)),
                  SizedBox(width: 15,),
                  MedCard(context: context, weather: w, title: 'wind',isdark: isdark, weatherIcons:Icon(WeatherIcons.wind)),

                ],),
            ),

          ),

          SizedBox(height: 10,),

          SizedBox(height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width *0.20,
                        decoration: BoxDecoration(
                            color: isdark?darkgray: lightgray,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(children: [
                          SizedBox(height: 10),
                          if(hour != null)
                            Text('${hour[index].dt != null ?DateFormat('kk:mm').format(hour[index].dt!) : ''}'),
                          SizedBox(height: 10),
                          getWeatherICon('${hour[index].mainConditions}'),
                          SizedBox(height: 10),
                          Text('${(hour[index].temp)?.round()}°C'.toString(),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                        ],),

                      ),
                    ),
                  );

                }, separatorBuilder:(context,index) => SizedBox(width: 8,) , itemCount: 8),

          )
        ],

      ),

    ),

  ),

);

Widget buildHome(Hours? he,List<ListHours> hour,Weather? w,String? position,BuildContext context,bool isdark, onpreesd) => SingleChildScrollView(
  child:   Container(

    child: Padding(

      padding:  EdgeInsets.all(20),

      child: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(children: [
                Text('  Home'),
                Spacer(),
                IconButton(
                  onPressed:(){
                    onpreesd.changeAppMode(null);
                  },
                  icon: Icon(isdark?Icons.dark_mode_sharp:Icons.light_mode),color:isdark?Colors.white:Colors.black,),
              ],),
            ),
            SizedBox(height: 10,),

            BigCard(w: w, assetName: getWeatherImages(w?.description,isdark), context: context, position: position),
            SizedBox(height: 10,),
            ClothesCard(context: context,isdark: isdark,Path: getWeatherClothes(w?.temp ?? 20, isdark) ?? '',title: getClothesDespription(w!.temp)),
            SizedBox(height: 10,),
            Center(

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    MedCard(context: context, weather: w, title: 'Max Temp',isdark: isdark, weatherIcons:Icon(Icons.device_thermostat_outlined)),
                    SizedBox(width: 15,),
                    MedCard(context: context, weather: w, title: 'humidity',isdark: isdark, weatherIcons:Icon(WeatherIcons.humidity)),
                    SizedBox(width: 15,),
                    MedCard(context: context, weather: w, title: 'wind',isdark: isdark, weatherIcons:Icon(WeatherIcons.wind)),

                  ],),
              ),

            ),

            SizedBox(height: 10,),

            SizedBox(height: 150,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder:(context,index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width *0.20,
                          decoration: BoxDecoration(
                              color: isdark?darkgray: lightgray,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(children: [
                            SizedBox(height: 10),
                            if(hour != null)
                              Text('${hour[index].dt != null ?DateFormat('kk:mm').format(hour[index]!.dt!) : ''}'),
                            SizedBox(height: 10),
                            getWeatherICon('${hour[index].mainConditions}'),
                            SizedBox(height: 10),
                            Text('${(hour[index].temp)?.round()}°C'.toString(),
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                          ],),

                        ),
                      ),
                    );

                  }, separatorBuilder:(context,index) => SizedBox(width: 8,) , itemCount: 8),

            )
          ],

        ),

      ),

    ),
  ),
);