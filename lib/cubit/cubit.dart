import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app_bloc_cubit/compants/widgets.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';
import 'package:weather_app_bloc_cubit/main.dart';
import 'package:weather_app_bloc_cubit/models/hours.dart';
import 'package:weather_app_bloc_cubit/modules/reminder.dart';
import 'package:weather_app_bloc_cubit/network/remote/dio_helper.dart';

import '../compants/local_not.dart';
import '../models/weather.dart';
import '../modules/home.dart';
import '../modules/search.dart';
import '../network/local/cacheHelper.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isClick = false;
  bool isDark = false;
  MyApp? myApp;
  String? cityname;
  bool not_on = false;

  Position? currentPosition;
  String? currentAddress;

  List<Widget> bottomScreens = [
    HomePage(),
    SearchPage(),
    //ReminderPage()
  ];

  Weather? weather;
  Weather? weather_search;

  Hours? hours;
  List<ListHours> h = [];
  Hours? hours_search;
  List<ListHours> h_search = [];
  List<DropDownValueModel> items=[];
  List<String> countries=[];
  List<String> captils=[];


  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(WeatherBottomNavState());
  }

  void changeButton() {
    isClick = !isClick;
    emit(SerachClickState());
  }




  void changeAppMode(bool? fromShared){
    if(fromShared != null){
      fromShared = isDark;
      emit(WeatherChangeModeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isdark', value: isDark)?.then((value) {
        emit(WeatherChangeModeState());
      });}
  }

  void getHomeWeather() {
    emit(WeatherGetHomeLoadingState());
    getCurrentCity().then((city) {
      DioHelper.getData(
        url: 'weather',
        query: {
          'q': city,
          'lang': 'en',
          'appid': '3d10b0a15abf6cba0509147d2fbbdd51',
        },
      ).then((value) {
        if (value != null && value.statusCode == 200) {
          weather = Weather.fromJson(value.data);
          currentAddress = city;
          emit(WeatherGetHomeSuccessState());
        } else {
          emit(WeatherGetHomeErrorState('Failed to fetch weather data'));
        }
      }).catchError((error) {
        print('Network error: $error');
        emit(WeatherGetHomeErrorState(error.toString()));
      });
    }).catchError((error) {
      print('Location error: $error');
      emit(WeatherGetHomeErrorState(error.toString()));
    });
  }

  void AfterSplach(BuildContext context){
    emit(WeatherSplachScreenState());
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyHomePage()
            )
        )
    );
    emit(WeatherMainScreenState());

  }

  void getHomeForecast() {
    emit(ForacstGetHomeSuccessState());
    getCurrentCity().then((city) {
      DioHelper.getData(
        url: 'forecast',
        query: {
          'q': city,
          'lang': 'en',
          'cnt': 8,
          'appid': '3d10b0a15abf6cba0509147d2fbbdd51',
        },
      ).then((value) {
        if (value != null && value.statusCode == 200) {
          hours = Hours.fromJson(value.data);
          h = hours?.list ?? [];
          currentAddress = city;
          emit(ForacstGetHomeSuccessState());
        } else {
          emit(ForacstGetHomeErrorState('Failed to fetch forecast data'));
        }
      }).catchError((error) {
        print('Network error: $error');
        emit(ForacstGetHomeErrorState((error.toString())));
      });
    }).catchError((error) {
      print('Location error: $error');
      emit(ForacstGetHomeErrorState((error.toString())));
    });
  }

  void getSearchWeather(String value) {
    emit(WeatherGetSearchLoadingState());
    DioHelper.getData(
      url: 'weather',
      query: {
        'q': value,
        'lang': 'en',
        'appid': '3d10b0a15abf6cba0509147d2fbbdd51',
      },
    ).then((value) {
      if (value != null && value.statusCode == 200) {
        weather_search = Weather.fromJson(value.data);
        emit(WeatherGetSearchSuccessState());
      } else {
        emit(WeatherGetSearchErrorState('Failed to fetch search weather data'));
      }
    }).catchError((error) {
      print('Network error: $error');
      emit(WeatherGetSearchErrorState(error.toString()));
    });
  }

  void getSearchForecast(String value) {
    emit(ForcastSerachLoadingState());
    DioHelper.getData(
      url: 'forecast',
      query: {
        'q': value,
        'lang': 'en',
        'cnt': 8,
        'appid': '3d10b0a15abf6cba0509147d2fbbdd51',
      },
    ).then((value) {
      if (value != null && value.statusCode == 200) {
        hours_search = Hours.fromJson(value.data);
        h_search = hours_search?.list ?? [];
        emit(ForcastGetSearchSuccessState());
      } else {
        emit(ForcastGetSearchErrorState('Failed to fetch search forecast data'));
      }
    }).catchError((error) {
      print('Network error: $error');
      emit(ForcastGetSearchErrorState(error.toString()));
    });
  }


  Future getCountries() async{
    var baseUrl= 'https://countriesnow.space/api/v0.1/countries/capital';
    http.Response  response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);


      countries.clear();
      captils.clear();
      items.clear();


      // Process each country data
      for (var country in jsonData['data']) {
        countries.add(country['name']);
        captils.add(country['capital']);
        items.add(DropDownValueModel(name: captils.last, value: captils.last));
        

      }
      emit(CountriesLoadedState());

    } else {
      emit(CountriesErrorState());
    }
  }



  Future<String> getCurrentCity() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return 'Location services are disabled';
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return 'Location permissions are permanently denied';
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemark = await placemarkFromCoordinates(
          position.latitude, position.longitude);

      String? cityName = placemark[0].locality;
      currentAddress = cityName;

      return cityName ?? "";
    } catch (e) {
      print('Location error: $e');
      return 'Error getting location: $e';
    }
  }

  //  void  listenToNotifications(BuildContext context,) {
  //   print("Listening to notification");
  //   LocalNotifications.onClickNotification.stream.listen((event) {
  //     print(event);
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  //   });
  //   emit(GetNotificationSuccess());
  // }
  //




  // Future<void> scheduleNewNotification() async {
  //
  //   await AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: -1, // -1 is replaced by a random number
  //           channelKey: 'alerts',
  //           title: "Huston! The eagle has landed!",
  //           body:
  //           "A small step for a man, but a giant leap to Flutter's community!",
  //           bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
  //           largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
  //           //'asset://assets/images/balloons-in-sky.jpg',
  //           notificationLayout: NotificationLayout.BigPicture,
  //           payload: {
  //             'notificationId': '1234567890'
  //           }),
  //       actionButtons: [
  //         NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
  //         NotificationActionButton(
  //             key: 'DISMISS',
  //             label: 'Dismiss',
  //             actionType: ActionType.DismissAction,
  //             isDangerousOption: true)
  //       ],
  //       schedule: NotificationCalendar.fromDate(
  //           date: DateTime.now().add( Duration(seconds: 10))));
  // }

}
