import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_cubit.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';
import 'package:news_api/shared/network/dio_helper.dart';
import 'package:news_api/shared/network/getstorage_helper.dart';
import 'package:news_api/shared/style/themes/dark_theme.dart';
import 'package:news_api/shared/style/themes/light_theme.dart';
import 'layout/homenews_layout/home_layout_view.dart';
import 'shared/mybloc_observer.dart';

void main() async {
  // to sure asyn fun done before run app
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  bool isUseSystemTheme = GetStorageHelper.checkHasData('isUseSystemTheme')
      ? GetStorageHelper.readData('isUseSystemTheme') as bool
      : true;
  bool isDark = GetStorageHelper.checkHasData('isDark')
      ? GetStorageHelper.readData('isDark') as bool
      : false;
  runApp(MyApp(isUseSystemTheme, isDark));
}

class MyApp extends StatelessWidget {
  final bool isUseSystemTheme, isDark;
  const MyApp(this.isUseSystemTheme, this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..changeTheme(savedValue: isDark)
        ..changeUseSystemTheme(savedValue: isUseSystemTheme)
        ..getBusiness()
        ..getScience()
        ..getSports(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return MaterialApp(
              title: 'New App',
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: cubit.isUseSystemTheme
                  ? ThemeMode.system
                  : cubit.isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
              // themeMode: ThemeMode.system,
              home: const HomeLayoutView(),
            );
          }),
    );
  }
}
