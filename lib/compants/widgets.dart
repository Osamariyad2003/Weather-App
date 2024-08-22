import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_cubit/styles/colors.dart';
import 'package:weather_icons/weather_icons.dart';
import '../models/hours.dart';
import '../models/weather.dart';

String getWeatherImages(String? main, bool? isdark) {
  if (main == null) return isdark == true ? 'aseets/images/Weather/clear sky.jpg' : 'aseets/images/Weather/clearsky-dark.jpg';
  switch (main.toLowerCase()) {
    case 'clear sky':
      return isdark == true ? 'aseets/images/Weather/clearsky-dark.jpg' : 'aseets/images/Weather/clear sky.jpg';
    case 'broken clouds':
      return isdark == true ? 'aseets/images/Weather/broken-clouds.jpg' : 'aseets/images/Weather/broken-clouds.jpg';
    case 'few clouds':
      return isdark == true ? 'aseets/images/Weather/cloudy-dark.jpg' : 'aseets/images/Weather/cloudy.jpg';
    case 'scattered clouds':
      return isdark == true ? 'aseets/images/Weather/cloudy-dark.jpg' : 'aseets/images/Weather/scattered clouds.jpg';
    case 'thunderstorm':
      return isdark == true ? 'aseets/images/Weather/thunderstorm.jpg' : 'aseets/images/Weather/thunderstorm.jpg';
    case 'rain':
      return isdark == true ? 'aseets/images/Weather/rain.jpg' : 'aseets/images/Weather/rain.jpg';
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'fog':
      return isdark == true ? 'aseets/images/Weather/mist.jpg' : 'aseets/images/Weather/mist.jpg';
    case 'snow':
      return isdark == true ? 'aseets/images/Weather/snow-dark.jpg' : 'aseets/images/Weather/snow.jpg';
    default:
      return isdark == true ? 'aseets/images/Weather/cloudy-dark.jpg' : 'aseets/images/Weather/cloudy.jpg';
  }
}

String? getWeatherClothes(double temp, bool? isdark) {
  if (temp >= 20.0 && isdark == false) return 'aseets/images/clothes/tee-shirt.png';
  else if (temp >= 20.0 && isdark == true) return 'aseets/images/clothes/tee-shirt-dark.png';
  else if ((temp >= 11.0 && temp <= 19) && isdark == false) return 'aseets/images/clothes/hoodie-jacket.png';
  else if ((temp >= 11.0 && temp <= 19) && isdark == true) return 'aseets/images/clothes/hoodie-jacket-dark.png';
  else if (temp < 10 && isdark == false) return 'aseets/images/clothes/winter-jacket.png';
  else if (temp < 10 && isdark == true) return 'aseets/images/clothes/winter-jacket-dark.png';
}


String? getClothesDespription( double  temp,){
  if(temp >= 20.0  ) return 'T-Shirt' ;
  else if(temp >=11.0 && temp <=19  ) return 'Hoodie';
  else if( temp<10.0  ) return 'Jacket';

}

Widget getWeatherICon(String? icon,){
  if(icon == null) return BoxedIcon(WeatherIcons.day_cloudy,) ;
  switch(icon.toLowerCase()){
    case '01d':
      return  BoxedIcon(WeatherIcons.day_sunny,) ;
    case '01n':
      return BoxedIcon(WeatherIcons.night_clear,) ;
    case '02d':
      return  BoxedIcon(WeatherIcons.day_cloudy,);
    case '02n':
      return  BoxedIcon(WeatherIcons.night_alt_cloudy,);
    case '03d':
      return  BoxedIcon(WeatherIcons.day_cloudy_high,);
    case '03n':
      return  BoxedIcon(WeatherIcons.night_alt_cloudy_high,);
    case '04d':
      return  BoxedIcon(WeatherIcons.day_cloudy_gusts,);
    case '04n':
      return  BoxedIcon(WeatherIcons.night_alt_cloudy_gusts,);
    case '09d':
      return  BoxedIcon(WeatherIcons.day_showers,);
    case '09n':
      return  BoxedIcon(WeatherIcons.night_alt_showers,);
    case '10d':
      return  BoxedIcon(WeatherIcons.rain,);
    case '10n':
      return  BoxedIcon(WeatherIcons.rain,);
    case '11d':
      return  BoxedIcon(WeatherIcons.day_thunderstorm,);
    case '11n':
      return  BoxedIcon(WeatherIcons.night_thunderstorm,);
    case '13d':
      return  BoxedIcon(WeatherIcons.day_snow,);
    case '13n':
      return  BoxedIcon(WeatherIcons.night_snow,);
    case '50d':
      return  BoxedIcon(WeatherIcons.day_haze,);
    case '50n':
      return  BoxedIcon(WeatherIcons.night_fog,);

    default:
      return BoxedIcon(WeatherIcons.day_cloudy);
  }
}

Widget ClothesCard({required BuildContext context, Weather? weather, String? title,required  String Path,required bool isdark})=> Container(
    height: 110,
    width: double.infinity,

    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(15),
      color: isdark?  Colors.black45: Colors.white70,


    ),

    padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),

    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Container(
          height: 60,
            width: 60,
            child: Image(image: AssetImage(Path,),fit: BoxFit.cover,)),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title != null)
              Text(title,style: TextStyle(fontSize: 26,color: isdark? Colors.white:darkgray),),

              Container(height:40,child: Text('IT\'s ${weather?.main} out,\nSo grab $title and be comfy!',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600)))



          ],
        )





      ],),
    ),
  );
Widget BigCard({ Weather? w, String? position,required String assetName,required BuildContext context})
=>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(Icons.location_on_outlined,),
            SizedBox(width: 10,),
            Text('${position}',style: TextStyle(fontSize: 20),),
          ],
        ),
        if(w != null)
          Text('${(w.temp).round()}°C',style: TextStyle(fontSize: 38),),
        SizedBox(height: 8,),
        Text('${w?.description}'),
      ],
    );
    // Align(
    //   alignment: Alignment.center,
    //   child: Stack(
    //     alignment: Alignment.center,
    //     children: [
    //
    //     Container(
    //       height: 300,
    //       width: double.infinity,
    //
    //       child: Opacity(
    //           opacity: 0.6,
    //           child: ClipRRect(
    //               borderRadius: BorderRadius.circular(20),
    //
    //               child: Image(image: AssetImage(assetName),fit: BoxFit.fill,))),
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //
    //           children: [
    //             Icon(Icons.location_on_outlined,),
    //             SizedBox(width: 10,),
    //             Text('${position}',style: TextStyle(fontSize: 20),),
    //           ],
    //         ),
    //         if(w != null)
    //          Text('${(w.temp).round()}°C',style: TextStyle(fontSize: 38),),
    //         SizedBox(height: 8,),
    //         Text('${w?.description}'),
    //       ],
    //     ),
    //
    //
    //
    //   ],),
    // );
Widget MedCard({required BuildContext context, Weather? weather, String? title,required bool isdark,required Icon weatherIcons}) => Container(
  height: 110,
  width: MediaQuery.of(context).size.width *0.27,

  decoration: BoxDecoration(
    border: Border.all(
      color: isdark?Colors.white: Colors.black,
      width:1,
    ),
    borderRadius: BorderRadius.circular(15),

  ),
  child: Container(
    padding: EdgeInsets.all(3),
    decoration: BoxDecoration(
        color: isdark?  Colors.black45: Colors.white70,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(children: [
      weatherIcons,
      SizedBox(height: 8,),
      if(title != null)
        Text(title),
      SizedBox(height: 5,),
      getweatherStatus(Title: title!, weather: weather!)




    ],),
  ),
);

dynamic getweatherStatus({required String Title,required Weather weather}){
  if (Title == 'wind')
    return Text('${weather.speed}km/h');
  else if (Title == 'humidity')
    return Text('${weather.humidity}%');
  else if (Title == 'Max Temp')
    return Text('${weather.temp_max.round()}°C');
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  onTap,
  required bool isdark,

  required  validate,
  required String label,
   IconData? prefix,

  bool isClickable = true,
}) =>
    TextFormField(
      style: TextStyle(color:isdark? Colors.white:Colors.black),

      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle( fontSize: 16.0),
        prefixIcon: Icon(
          prefix,
        ),

        border: OutlineInputBorder(

        ),
      ),
    );




Widget NotifcationLine({controller,isdark,validate,onchange,value}) => Padding(
  padding:  EdgeInsets.all(20.0),
  child: Row(
    children: [
      Text('Time'),
      SizedBox(width: 5,),
      Container(
        width: 100,
          height: 100,
          child: defaultFormField(controller: controller, type: TextInputType.datetime, isdark: isdark, validate: validate, label: 'Time',)),
      Spacer(),
      Icon(Icons.notifications_active_outlined),
      Switch(value: value, onChanged: onchange)


    ],
  ),
);

void ShowError(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Failed to get forecast information. Please try again.'),
      backgroundColor: Colors.red,
    ),
  );
}



