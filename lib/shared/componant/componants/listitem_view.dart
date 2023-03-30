import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_cubit.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';
import 'package:news_api/shared/componant/navigate/navigate.dart';
import '../../../modules/web_view/web_view.dart';
import '../../style/check_sys_theme.dart';
import '../../style/colors.dart';
import 'news_img.dart';

class ListItemView extends StatelessWidget {
  final String url, title, des, time, date, urlweb;
  ListItemView({
    super.key,
    required this.url,
    required this.title,
    required this.des,
    required this.time,
    required this.date,
    required this.urlweb,
  });
  final RegExp english = RegExp('[a-zA-Z0-9]', caseSensitive: false);
  final RegExp arabic = RegExp(r'[\u0750-\u077F]', caseSensitive: true);
  @override
  Widget build(BuildContext context) {
//===============check phone dark or light ===
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isPhoneDarkMode = brightness == Brightness.dark;
    return Directionality(
      textDirection: english.hasMatch(title
                  .split('pattern')[0]
                  .toString()
                  .split('')[0]
                  .toString()) ||
              english.hasMatch(
                  title.split('pattern')[0].toString().split('')[1].toString())
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => push(context, WebViewScreen(urlarticale: urlweb)),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cubit.isUseSystemTheme
                      ? isSyDark(context)
                          ? dSecColor
                          : lSecColor
                      : cubit.isDark
                          ? dSecColor
                          : lSecColor,
                ),
                height: 250,
                child: Column(
                  children: [
                    NewsImg(
                      url,
                      width: double.infinity,
                      height: 150,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            des,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(date),
                              Text(time),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
