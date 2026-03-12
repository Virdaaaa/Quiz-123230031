import 'package:flutter/material.dart';
import '../models/post.dart';

class DetailPage extends StatelessWidget {
  final Post post;
  const DetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 230, 240),
      appBar: AppBar(
        title: Text("Detail Postingan"),
        backgroundColor: const Color.fromARGB(255, 245, 230, 240),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(post.imageUrl),
            const SizedBox(height: 10),
            Text(
              post.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Divider(),
            Text(
              post.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(post.content),
            const Divider(),
            const Text(
              "Komentar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...post.comments.map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "- $c",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 200, 154, 190),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali Ke List"),
            ), // [cite: 44]
          ],
        ),
      ),
    );
  }
}
