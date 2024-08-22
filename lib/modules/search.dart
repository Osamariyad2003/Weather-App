import 'dart:math';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_cubit/cubit/cubit.dart';
import 'package:weather_app_bloc_cubit/cubit/states.dart';

import '../compants/pages.dart';
import '../compants/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = WeatherCubit.get(context);
    //var searchController = TextEditingController();
    var   searchController = SingleValueDropDownController();


    return BlocConsumer<WeatherCubit,WeatherStates>(listener: (BuildContext context, WeatherStates state) {  },
      builder: (BuildContext context, WeatherStates state) {
      return SingleChildScrollView(
        child: Container(
          height:  MediaQuery.of(context).size.height *0.999999,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(cubit.weather_search !=null? getWeatherImages(cubit.weather_search?.description,cubit.isDark):getWeatherImages(cubit.weather?.description,cubit.isDark)),
                opacity: 0.8,// because if you want a transparent navigation bar I assume that you have either a background image or a background color. You need to add the image you want and also authorize it in pubspec.yaml
                fit: BoxFit.cover
            ),),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    IconButton(onPressed: (){
                      cubit.changeButton();
                      cubit.getCountries();
                    }, icon:cubit.isClick? Icon(Icons.close) : Icon(  Icons.search_rounded),),
                    SizedBox(width: 20,),
                    cubit.isClick?     Expanded(
                        child:DropDownTextField(
                          controller: searchController,
                          clearOption: true,
                          enableSearch: true,
                          searchAutofocus: true,
                          searchKeyboardType: TextInputType.text,
                          clearIconProperty: IconProperty(color: Colors.green),
                          textFieldDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter text",
                            hintStyle: TextStyle(color: cubit.isDark ? Colors.white54 : Colors.black54),
                            filled: true,
                            fillColor: cubit.isDark ? Colors.black : Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: cubit.isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: cubit.isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          textStyle: TextStyle(color: cubit.isDark ? Colors.white : Colors.black),
                          searchTextStyle: TextStyle(color: cubit.isDark ? Colors.white : Colors.black),
                          searchDecoration: InputDecoration(
                            hintText: "Enter your custom hint text here",
                            hintStyle: TextStyle(color: cubit.isDark ? Colors.white54 : Colors.black54),
                            filled: true,
                            fillColor: cubit.isDark ? Colors.black : Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: cubit.isDark ? Colors.white : Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: cubit.isDark ? Colors.white : Colors.black,
                              ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 6,
                          dropDownList: cubit.items,
                          onChanged: (val) {
                            val = searchController.dropDownValue?.value;
                            cubit.getSearchWeather(val);
                            cubit.getSearchForecast(val);
                            cubit.cityname = val;
                          },
                        )

                    ):Text(' Search ')
                  ],
                ),
              ),
              if (state is WeatherGetSearchLoadingState || state is ForcastSerachLoadingState) LinearProgressIndicator(),
                if( cubit.weather_search != null&&cubit.hours_search != null)
                buildSearch(cubit.hours_search,cubit.h_search,cubit.weather_search, cubit.cityname, context,cubit.isDark)

            ],
          ),
        ),
      );
      },);
  }
}
