import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_cubit.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';
import 'componant/setting_row_button.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('setting')),
            body: Column(
              children: [
                SettingRowButton(
                  title: 'Theme',
                  subTitle: 'use System Theme \nwill use if true ',
                  onTap: cubit.changeUseSystemTheme,
                  value: cubit.isUseSystemTheme,
                ),
                !cubit.isUseSystemTheme
                    ? SettingRowButton(
                        title: 'App Theme',
                        subTitle: 'use dark mode',
                        onTap: cubit.isUseSystemTheme ? () {} : cubit.changeTheme,
                        value: cubit.isDark,
                      )
                    : const SizedBox(),
              ],
            ),
          );
        });
  }
}
