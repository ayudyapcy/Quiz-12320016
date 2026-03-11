import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latihan_kuis_123230016_ayudya_cans/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {

  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  void openWikipedia() async {
    final Uri url = Uri.parse(movie.movieUrl);

    if (!await launchUrl(url)) {
      throw Exception("Could not launch ${movie.movieUrl}");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8), // background pink soft

      appBar: AppBar(
        title: const Text("Movie Detail"),
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.imgUrl,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.pink),
                    const SizedBox(width: 5),
                    Text("${movie.rating}/10"),
                  ],
                ),

                const SizedBox(height: 10),

                Text("Year: ${movie.year}"),
                Text("Genre: ${movie.genre}"),
                Text("Director: ${movie.director}"),

                const SizedBox(height: 10),

                Text("Cast: ${movie.casts.join(", ")}"),

                const SizedBox(height: 20),

                const Text(
                  "Synopsis",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),

                const SizedBox(height: 8),

                Text(movie.synopsis),

                const SizedBox(height: 30),

                Center(
                  child: ElevatedButton.icon(
                    onPressed: openWikipedia,
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text("Open Wikipedia"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
