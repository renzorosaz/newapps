import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_models.dart';
import 'package:http/http.dart' as http;

  final _URL_NEWS = "http://newsapi.org/v2";
  final _APIKEY = "6a9b814a7a47441cbe19b9439c896fe5";

class NewsService with ChangeNotifier{

  List<Article> headlines =[];
  String _selectedCategory= 'business';

  List<Category> categorires =[
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressBook, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),


  ];

  Map<String,List<Article>> categoryArticles ={};

  NewsService(){

    this.getTopHeadlines();
    
    categorires.forEach((item){
      this.categoryArticles[item.name] = new List();
    });

  }
  
  get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor){
    this._selectedCategory =valor;

    this.getArticlesByCaegory(valor);

    notifyListeners();
  }

  List<Article> get getArticulosCategoriasSeleccionadas  => this.categoryArticles[this.selectedCategory];




  getTopHeadlines() async{
    
    final url='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=au';
    final resp = await http.get(url);

    final newsResponse= newResponseFromJson(resp.body);

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
  
  getArticlesByCaegory(String category) async {

      if(this.categoryArticles[category].length > 0){

        return this.categoryArticles[category];
      }

      final url='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=au&category=$category';
      final resp = await http.get(url);

      final newsResponse= newResponseFromJson(resp.body);

      this.categoryArticles[category].addAll(newsResponse.articles);
       notifyListeners();
  }
}