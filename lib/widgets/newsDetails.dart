import 'package:flutter/material.dart';

class newsDetails extends StatelessWidget {
  newsDetails({super.key, required this.article});
  var article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
                  article.publishedAt != null ? Text(article.publishedAt.toString()) : SizedBox(),
                  SizedBox(height: 4,),
            article.urlToImage != null
                ? Image.network(article.urlToImage)
                : Image.network(
                    'https://imgs.search.brave.com/udmDGOGRJTYO6lmJ0ADA03YoW4CdO6jPKGzXWvx1XRI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAyLzY4LzU1LzYw/LzM2MF9GXzI2ODU1/NjAxMl9jMVdCYUtG/TjVyalJ4UjJleVYz/M3puSzRxblllS1pq/bS5qcGc'),
            SizedBox(height: 10.0),
            Text(
              article.description ?? '',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            article.content != null ? Text(article.content) : SizedBox()
          ]),
        ));
  }
}
