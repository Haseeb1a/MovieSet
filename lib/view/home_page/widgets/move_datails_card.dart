import 'package:flutter/material.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/view/details_page/details_page.dart';
import 'package:movieset/widgets/movie_button.dart';

class MovieDetails extends StatelessWidget {
  final Movies movies;
  const MovieDetails({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        // height: ,
        margin: const EdgeInsets.fromLTRB(0.0, 250, 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.black.withOpacity(
                0.08,
              ),
            ),
          ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              movies.title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  movies.rating,
                  (index) => const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow,
                      )),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 17
                ),
                  
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(movies: movies)));
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 62.0),
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(18)),
                      alignment: Alignment.center,
                      child: Text(
                        'VIEW',
                        style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
