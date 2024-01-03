import 'package:flutter/material.dart';
import 'package:movieset/model/movie_model.dart';

class MovieDetails extends StatelessWidget {
  final Movies movies;
  const MovieDetails({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.fromLTRB(0.0, 250, 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              
            blurRadius: 4.0,
            color:             Colors.black.withOpacity(0.08,),

          ),],
          
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  movies.image,
                  height: 290,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    
            Text(movies.title,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
             SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
    List.generate(5, (index) =>  Icon(Icons.star,size: 20,color: Colors.yellow,))
            ,)
          ],
        ),
      ),
    );
  }
}
