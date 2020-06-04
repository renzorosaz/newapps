import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias({this.noticias});

  @override
  Widget build(BuildContext context) {

      return ListView.builder(
        itemCount: this.noticias.length,  
        itemBuilder: (BuildContext context, int index){

          return _Noticia(noticia:this.noticias[index], index: index,);

        }
      );
  }


}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    @required this.noticia,
    @required this.index
    });
  
  @override
  Widget build(BuildContext context) {

      return Column(
        children: <Widget>[
          _TarjetaTopBar(noticia:noticia,)
        ],
      );

  }
}

class _TarjetaTopBar extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TarjetaTopBar({this.noticia, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('$index + 1')
        ],
      ),
    );
  }
}