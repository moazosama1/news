import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/models/News.dart';

class NewsItem extends StatelessWidget {
  News? news;
  NewsItem(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: news?.urlToImage ?? "",
              width: double.infinity,
              height: 230,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: theme.colorScheme.primaryContainer,
                size: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                news?.source?.name ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                news?.title ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15, color: theme.colorScheme.inverseSurface),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                news?.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.end,
                style:const TextStyle(
                    fontSize: 12, color: Color(0xffA3A3A3)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
