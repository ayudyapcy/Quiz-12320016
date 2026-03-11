import 'package:flutter/material.dart';
import 'package:latihan_kuis_123230016_ayudya_cans/models/movie_model.dart';
import 'package:latihan_kuis_123230016_ayudya_cans/screen/movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {

  List<bool> addedList = List.generate(movieList.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8), // background pink soft

      appBar: AppBar(
        title: const Text("Movie List"),
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),

          child: Column(
            children: [

              const SizedBox(height: 20),

              const Text(
                "Welcome, Ayudya Cans!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {

                    final movie = movieList[index];

                    return Card(
                      color: const Color(0xFFFFE4EC), // card pink soft
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: InkWell(

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailPage(movie: movie),
                            ),
                          );
                        },

                        child: Padding(
                          padding: const EdgeInsets.all(10),

                          child: Row(
                            children: [

                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  movie.imgUrl,
                                  width: 90,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "${movie.title} (${movie.year})",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      movie.genre,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Row(
                                      children: [

                                        const Icon(
                                          Icons.star,
                                          color: Colors.pink,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 4),

                                        Text("${movie.rating}/10"),
                                      ],
                                    ),

                                    const SizedBox(height: 10),

                                    OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          addedList[index] =
                                              !addedList[index];
                                        });
                                      },

                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: addedList[index]
                                            ? Colors.pink
                                            : Colors.white,
                                        side: const BorderSide(
                                          color: Colors.pink,
                                        ),
                                      ),

                                      child: Text(
                                        "Add To List",
                                        style: TextStyle(
                                          color: addedList[index]
                                              ? Colors.white
                                              : Colors.pink,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
