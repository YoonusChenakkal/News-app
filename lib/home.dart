import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_news/model.dart';

class home extends StatefulWidget {
  home({super.key});
  News? news;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final queryParameters = {
    'country': 'IN',
    'apiKey': 'afbe19f351d641b4a6ce1625ef1d0343'
  };

  getNews() async {
    var url = Uri.http('newsapi.org', '/v2/top-headlines', queryParameters);
    print(url);
    var response = await http.get(url);
    print('Response $response');
    if (response.statusCode == 200) {
      setState(() {
        var news = newsFromJson(response.body);
        Future.delayed(Duration(minutes: 5), getNews);
      });
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
 @override
  void initState() {
    // TODO: implement initState
    
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
             if (widget.news != null && widget.news!.articles.isNotEmpty)
          Column(
            children: widget.news!.articles.map((article) {
              // Display title and URL of each article
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.url),
              );
            }).toList(),
          )
        else
          Text('No Data')
          ],
        ));
  }
}
