abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeBottNavChangeState extends HomeStates {}

class BussLoadingState extends HomeStates {}

class BussGetDataState extends HomeStates {}

class BussErrorDataState extends HomeStates {
  final String error;
  BussErrorDataState(this.error);
}

class SportsLoadingState extends HomeStates {}

class SportsGetDataState extends HomeStates {}

class SportsErrorDataState extends HomeStates {
  final String error;
  SportsErrorDataState(this.error);
}

class ScienceLoadingState extends HomeStates {}

class ScienceGetDataState extends HomeStates {}

class ScienceErrorDataState extends HomeStates {
  final String error;
  ScienceErrorDataState(this.error);
}
class SearchLoadingState extends HomeStates {}

class SearchGetDataState extends HomeStates {}

class SearchErrorDataState extends HomeStates {
  final String error;
  SearchErrorDataState(this.error);
}
class ChangeThemeState extends HomeStates {}
class ChangeUseSystemThemeState extends HomeStates {}
