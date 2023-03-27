import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsImg extends StatelessWidget {
  final String? imgUrl;

  const NewsImg(this.imgUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0x642195F3),
          borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          width: 100,
          height: 100,
          imageUrl: imgUrl ??
              'https://lynx-lb.com/uploads/gallery/Albums/2019/04-01-2019/da0d5f1151.png',
          placeholder: (context, url) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) => const Icon(
            Icons.image,
            size: 100,
            color: Colors.grey,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
