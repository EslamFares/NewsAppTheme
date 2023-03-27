import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_cubit.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';
import 'package:news_api/modules/settings/settings_view.dart';
import '../../shared/componant/navigate/navigate.dart';
import '../../shared/network/dio_helper.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('New App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  push(context, const SettingView());
                },
                icon: const Icon(
                  Icons.settings,
                ),
              )
            ],
          ),
          body: cubit.bodyHomeScreens[cubit.currentBottNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottNavItems,
            currentIndex: cubit.currentBottNavIndex,
            onTap: cubit.changeBottNavIndex,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await DioHelper.init();
              cubit.refresh();
            },
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}
