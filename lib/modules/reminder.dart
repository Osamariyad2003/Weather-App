import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc_cubit/compants/local_not.dart';
import 'package:weather_app_bloc_cubit/cubit/cubit.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';
import '../compants/widgets.dart';
import 'package:timezone/timezone.dart' as tz;



// class ReminderPage extends StatelessWidget {
//    ReminderPage({Key? key}) : super(key: key);
//    List<TextEditingController> TimeControllers = [
//      TextEditingController(),
//    TextEditingController(),
//    TextEditingController(),
//    ];
//
//
//    @override
//   Widget build(BuildContext context) {
//     return  BlocConsumer<WeatherCubit,WeatherStates>(listener: (BuildContext context, WeatherStates state) {  },
//
//       builder: (BuildContext context, WeatherStates state) {
//       var cubit = WeatherCubit.get(context);
//       return Container(
//           height: MediaQuery.of(context).size.height*0.9999,
//           decoration: BoxDecoration(
//           image: DecorationImage(
//           image: ExactAssetImage( getWeatherImages(cubit.weather?.description,cubit.isDark)),
//             fit: BoxFit.cover,))
//         ,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: (context,index) {return NotifcationLine(
//                   controller: TimeControllers[index],
//                   isdark: cubit.isDark,
//                   value: cubit.not_on,
//                   onchange: (value) async{
//                      DateFormat timeFormat = DateFormat.Hm();
//                     final now = tz.TZDateTime.now(tz.local);
//                      DateTime scheduledTime = timeFormat.parse(TimeControllers[index].text);
//
//
//
//                       // Calculate the difference
//                       Duration difference = scheduledTime.difference(now);
//                       cubit.changeSwtchState(cubit.not_on);
//                       await LocalNotifications.showScheduleNotification(
//                         title: 'kk',
//                         body: '',
//                         payload: '',
//                         tm: difference,
//                         id: index + 1,
//                       );
//                     },
//                 );},itemCount: TimeControllers.length,)
//
//
//             ],
//           ),
//         ),
//       );
//       },
//
//     );
//   }
// }
