import 'package:flutter/material.dart';
import 'listitem_view.dart';

class ArticlesListView extends StatelessWidget {
  ArticlesListView({
    super.key,
    required this.list,
  });
  final ScrollController _scrollController = ScrollController();
  final List list;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      // isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String time = list[index]
              .publishedAt
              .toString()
              .split('T')[1]
              .toString()
              .substring(1, 5);
          String date = list[index].publishedAt.toString().split('T')[0];
          return ListItemView(
            url: list[index].urlToImage != 'null'
                ? list[index].urlToImage
                : 'https://mostaql.hsoubcdn.com/uploads/thumbnails/1455379/62cc64a33ee9b/unnamed.jpg',
            title: list[index].title,
            des: list[index].author,
            time: time,
            date: date,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
