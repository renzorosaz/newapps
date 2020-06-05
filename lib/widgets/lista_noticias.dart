import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/theme/tema.dart';


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;
  

  const ListaNoticias({this.noticias});

  @override
  Widget build(BuildContext context) {

      return ListView.builder(
        itemCount: this.noticias.length,  
        itemBuilder: (BuildContext context, int index){

          return _Noticia(
            index: index,
           noticia: this.noticias[index],
          );

        }
      );
  }


}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({Key key,
    @required this.noticia,
    @required this.index
    }) : super(key:key);
  
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
          Text('${index}' ,  style: TextStyle(color: miTema.accentColor),),
          Text('${noticia.source.name}.' ,  style: TextStyle(color: miTema.accentColor),),
        ],
      ),
    );

   
  }

}