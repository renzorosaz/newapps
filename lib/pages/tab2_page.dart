import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/tema.dart';
import 'package:news_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget  {

  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    
      final newService= Provider.of<NewsService>(context);

    return SafeArea(
          child: Scaffold(
        body: Column(
          children: <Widget>[
             _ListaCategorias(),

             Expanded(
               child: ListaNoticias(noticias: newService.getArticulosCategoriasSeleccionadas)
             )

          ],
        )
      ),
    );
  }

   @override
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {   

  @override
  Widget build(BuildContext context) {

    final categories= Provider.of<NewsService>(context).categorires;

    return Container(
      width: double.infinity,
      height: 100,
      
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){

          final cName= categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8) ,
            child: Column(
              children: <Widget>[
                _CategoryButton(categoria:categories[index] ),
                SizedBox(height:5),
                Text('${cName[0].toLowerCase() }${ cName.substring(1)}')
              ],
            ),
           );
        }
            ),
    );
  }
}

class _CategoryButton extends StatelessWidget  {


   

  final Category categoria;

  const _CategoryButton({ this.categoria});

  @override
  Widget build(BuildContext context) {

     final newsService= Provider.of<NewsService>(context);

    return GestureDetector(
        onTap: (){
         /*  print('Hola MUNDO');
          print('${categoria.name}'); */
          final newsService= Provider.of<NewsService>(context, listen: false);
           newsService.selectedCategory =categoria.name;           
          
        },
        child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          color:(newsService.selectedCategory == this.categoria.name) 
              ? miTema.accentColor
              : Colors.black54
        ),
      ),
    );

  }

 
}