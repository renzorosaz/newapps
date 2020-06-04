import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:http/http.dart' as http;

  final _URL_NEWS= "http://newsapi.org/v2";
  final _APIKEY= "6a9b814a7a47441cbe19b9439c896fe5";

class NewsService with ChangeNotifier{

  List<Article> headlines =[];

  NewsService(){


    this.getTopHeadlines();

  }
  getTopHeadlines() async{
    
    final url='$_URL_NEWS/top-headlines?sources=techcrunch&apiKey=$_APIKEY';
    final resp = await http.get(url);

    final newsResponse= newResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
  
}