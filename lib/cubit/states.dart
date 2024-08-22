abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherBottomNavState extends WeatherStates {}

class WeatherChangeModeState extends WeatherStates {}

class WeatherChangeLangState extends WeatherStates {}

class WeatherGetCurrentPostionState extends WeatherStates {}
class WeatherGetCurrentAddresState extends WeatherStates {}


class WeatherSplachScreenState extends WeatherStates {}
class WeatherMainScreenState extends WeatherStates {}






class WeatherGetHomeLoadingState extends WeatherStates {}

class WeatherGetHomeSuccessState extends WeatherStates {}

class WeatherGetHomeErrorState extends WeatherStates
{
  final String error;

  WeatherGetHomeErrorState(this.error);
}


class ForacstGetHomeLoadingState extends WeatherStates {}

class ForacstGetHomeSuccessState extends WeatherStates {}

class ForacstGetHomeErrorState extends WeatherStates
{
  final String error;

  ForacstGetHomeErrorState(this.error);
}


class WeatherGetSearchLoadingState extends WeatherStates {}


class WeatherGetSearchSuccessState extends WeatherStates {}

class WeatherGetSearchErrorState extends WeatherStates
{
  final String error;

  WeatherGetSearchErrorState(this.error);
}
class ForcastSerachLoadingState extends WeatherStates {}

class ForcastGetSearchSuccessState extends WeatherStates {}

class ForcastGetSearchErrorState extends WeatherStates
{
  final String error;

  ForcastGetSearchErrorState(this.error);

}
class SerachClickState extends WeatherStates {}
class  CountriesLoadedState  extends WeatherStates{}
class  CountriesErrorState  extends WeatherStates{}



class WeatherReminderState extends WeatherStates {}
class WeatherChangeSwtichState extends WeatherStates {}
class GetNotificationSuccess extends WeatherStates{}





