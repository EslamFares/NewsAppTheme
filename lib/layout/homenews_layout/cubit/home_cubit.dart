// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';
import 'package:news_api/models/article_model.dart';
import 'package:news_api/modules/business/business_view.dart';
import 'package:news_api/modules/science/science_view.dart';
import 'package:news_api/modules/sports/sports_view.dart';
import 'package:news_api/shared/componant/constants.dart';
import 'package:news_api/shared/network/dio_helper.dart';

import '../../../shared/network/getstorage_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  //=======================
  int currentBottNavIndex = 0;
  void changeBottNavIndex(index) {
    currentBottNavIndex = index;
    emit(HomeBottNavChangeState());
  }

  //===========
  List<Widget> bodyHomeScreens = const [
    BusinessView(),
    SportsView(),
    ScienceView()
  ];
  List<BottomNavigationBarItem> bottNavItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_sharp), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science')
  ];
  //==================

  List<ArticlesModel> businessList = [];
  void getBusiness() {
    emit(BussLoadingState());
    DioHelper.get(
            url: urlMethod,
            qurey: {'country': 'eg', 'category': 'business', 'apiKey': apiKey})
        .then((value) {
      List l = value.data['articles'] as List;
      l.forEach((element) {
        businessList.add(ArticlesModel.fromJson(element));
      });
      emit(BussGetDataState());
    }).catchError((err) {
      debugPrint('errrrror $err');
      emit(BussErrorDataState(err));
    });
  }
  //==================

  List<ArticlesModel> sportsList = [];
  void getSports() {
    emit(SportsLoadingState());
    DioHelper.get(
            url: urlMethod,
            qurey: {'country': 'eg', 'category': 'sports', 'apiKey': apiKey})
        .then((value) {
      List listformApi = value.data['articles'] as List;
      listformApi.forEach((element) {
        sportsList.add(ArticlesModel.fromJson(element));
      });
      emit(SportsGetDataState());
    }).catchError((err) {
      debugPrint('errrrror $err');
      emit(SportsErrorDataState(err));
    });
  }
  //==================

  List<ArticlesModel> scienceList = [];
  void getScience() {
    emit(ScienceLoadingState());
    DioHelper.get(
            url: urlMethod,
            qurey: {'country': 'us', 'category': 'science', 'apiKey': apiKey})
        .then((value) {
      List l = value.data['articles'] as List;
      l.forEach((element) {
        scienceList.add(ArticlesModel.fromJson(element));
      });
      emit(ScienceGetDataState());
    }).catchError((err) {
      debugPrint('errrrror $err');
      emit(ScienceErrorDataState(err));
    });
  }

  void refresh() {
    sportsList = [];
    businessList = [];
    scienceList = [];
    getBusiness();
    getScience();
    getSports();
  }

  //==========================================================
  bool isDark = false;
  void changeTheme({bool? savedValue}) {
    if (savedValue != null) {
      isDark = savedValue;
      emit(ChangeThemeState());
    } else {
      isDark = !isDark;
      GetStorageHelper.writeData('isDark', isDark)
          .then((value) => emit(ChangeThemeState()));
    }
  }

  bool isUseSystemTheme = true;
  void changeUseSystemTheme({bool? savedValue}) {
    if (savedValue != null) {
      isUseSystemTheme = savedValue;
      emit(ChangeUseSystemThemeState());
    } else {
      isUseSystemTheme = !isUseSystemTheme;
      GetStorageHelper.writeData('isUseSystemTheme', isUseSystemTheme)
          .then((value) => emit(ChangeUseSystemThemeState()));
    }
    // isDark = false;
  }

  //==================search====================
  final TextEditingController seachController = TextEditingController();
  final GlobalKey searchFormKey = GlobalKey<FormState>();
  List<ArticlesModel> searchList = [];
  void getSearch(String searchWord) {
    // String date = DateTime.now().toString().split(' ')[0];
    emit(SearchLoadingState());
    searchList = [];
    DioHelper.get(url: searchurlMethod, qurey: {
      'q': seachController.text,
      // 'from': date,
      'sortBy': 'publishedAt',
      'apiKey': apiKey,
    }).then((value) {
      // print(value);
      List l = value.data['articles'] as List;
      l.forEach((element) {
        searchList.add(ArticlesModel.fromJson(element));
        // seachController.clear();
      });
      emit(SearchGetDataState());
    }).catchError((err) {
      debugPrint('errrrror $err');
      emit(SearchErrorDataState(err.toString()));
    });
  }
}
