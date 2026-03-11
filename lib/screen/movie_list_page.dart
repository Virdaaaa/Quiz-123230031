import 'package:flutter/material.dart';
import 'package:belajar_kuisTPM/models/movie_model.dart'; // nah di sini movie model itu jgn lupa di import karena kita butuh data dari movie model untuk di tampilkan di movie list page
import 'movie_detail_page.dart'; 

class MovieListPage extends StatelessWidget {
  final String username;
  const MovieListPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome, $username!")),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}

class MovieCard extends StatefulWidget {
  final MovieModel movie;
  const MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(widget.movie.imgUrl, width: 50),
        title: Text("${widget.movie.title} (${widget.movie.year})"),
        subtitle: Text("${widget.movie.genre}\n⭐ ${widget.movie.rating}/10"),
        trailing: IconButton(
          icon: Icon(
            Icons.bookmark,
            color: isAdded ? Colors.blue : Colors.grey,
          ),
          onPressed: () => setState(() => isAdded = !isAdded),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie: widget.movie),
            ),
          );
        },
      ),
    );
  }
}
