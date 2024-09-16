import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../api/models/News.dart';

class NewsDetails extends StatelessWidget {
  News? selectedNews;
  NewsDetails(this.selectedNews, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: selectedNews?.urlToImage ?? "",
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                selectedNews?.source?.name ?? "",
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
                selectedNews?.title ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: theme.colorScheme.inverseSurface),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                selectedNews?.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 12, color: Color(0xffA3A3A3)),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    children: [
                      Text(
                        selectedNews?.description ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 1.6,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: theme.colorScheme.onInverseSurface),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        onTap: _launchUrl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View Full Article",
                              style: TextStyle(
                                  color: theme.colorScheme.inverseSurface,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Icon(
                              Icons.navigate_next_rounded,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (selectedNews?.url == null) {
      throw Exception('URL is null');
    }

    final Uri uri = Uri.parse(selectedNews!.url!);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${selectedNews?.url}');
    }
  }
}
