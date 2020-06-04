import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 
 
class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final headlines= Provider.of<NewsService>(context).headlines;
    //newsService.headlines;

    return Scaffold(
      body:ListaNoticias(noticias: headlines,)
      
    );
  }
}