import 'package:flutter/material.dart';
import 'package:belajar_kuisTPM/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart'; // Perlu plugin url_launcher di pubspec.yaml yaa

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  // Fungsi untuk membuka Wikipedia
  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(movie.movieUrl);
    if (!await launchUrl(url)) throw Exception('Could not launch $url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              movie.imgUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie.title} (${movie.year})",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Directed by ${movie.director}",
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 10),
                  Text(movie.synopsis),
                  const SizedBox(height: 10),
                  Text("Genre: ${movie.genre}"),
                  Text("Casts: ${movie.casts}"),
                  Text(
                    "Rated: ${movie.rating}/10",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _launchUrl,
                    child: const Text("Go to Wikipedia"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
