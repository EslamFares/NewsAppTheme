import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';

import '../../layout/homenews_layout/cubit/home_cubit.dart';
import '../../shared/componant/componants/articles_list_view.dart';

class ScienceView extends StatelessWidget {
  const ScienceView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          List list = HomeCubit.get(context).scienceList;
          return list.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ArticlesListView(list: list);
        });
  }
}
