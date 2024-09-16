import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/manager/api_manager.dart';
import 'package:news/api/models/source.dart';
import '../news_details/news_details.dart';
import 'custom_news_item.dart';

class ListNewsWidget extends StatefulWidget {
  Source? source;
  ListNewsWidget(this.source, {super.key});

  @override
  State<ListNewsWidget> createState() => _ListNewsWidgetState();
}

class _ListNewsWidgetState extends State<ListNewsWidget> {
  var selectedNews;
  @override
  Widget build(BuildContext context) {
    if(selectedNews != null){
      return NewsDetails(selectedNews);
    }
    return FutureBuilder(
      future: ApiManager.getNewsBySources(widget.source?.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Has Error"),
          );
        }
        if (snapshot.connectionState == ConnectionState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                overlayColor:const WidgetStatePropertyAll(Colors.transparent),
                  onTap:() {
                  setState(() {
                    selectedNews = newsList?[index];
                  });
                  } ,
                  child: Card(
                    color: Colors.white,
                child: CustomNewsItem(newsList?[index]),
              ));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: newsList?.length ?? 0);
      },
    );
  }
}
