import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_cubit.dart';
import 'package:news_api/layout/homenews_layout/cubit/home_states.dart';

import '../../shared/componant/componants/articles_list_view.dart';
import '../../shared/componant/componants/global_text_form.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            List list = HomeCubit.get(context).searchList;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: cubit.searchFormKey,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GlobalTextForm(
                            hintText: 'serach',
                            onchange: (val) {
                              // cubit.getSearch(val);
                            },
                            textController: cubit.seachController,
                            margin: const EdgeInsets.only(top: 0),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            cubit.getSearch(cubit.seachController.text);
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 60,
                            width: 55,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                const Icon(Icons.search, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: state is SearchLoadingState
                          ? const Center(child: CupertinoActivityIndicator())
                          : list.isEmpty
                              ? const Center(child: Text('No Search Data ...'))
                              : ArticlesListView(list: list))
                ],
              ),
            );
          }),
    );
  }
}
