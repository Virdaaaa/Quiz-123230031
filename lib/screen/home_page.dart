import 'package:Quiz_123230031/models/post.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 230, 240),
      appBar: AppBar(
        title: Text("Halo, $username!"),
        backgroundColor: const Color.fromARGB(255, 245, 230, 240),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          return PostCard(post: dummyPosts[index]);
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isUpvoted = false;
  bool isDownvoted = false;
  late int upCount;
  late int downCount;

  @override
  void initState() {
    super.initState();
    upCount = widget.post.upvotes;
    downCount = widget.post.downvotes;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: const Color.fromARGB(255, 200, 154, 190),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.post.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.post.title),
          ),
          Image.network(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.post.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_upward,
                    color: isUpvoted
                        ? const Color.fromARGB(255, 145, 24, 137)
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () => setState(() {
                    isUpvoted = !isUpvoted;
                    isUpvoted ? upCount++ : upCount--;
                    // Logika Bonus: Jika upvote ditekan, matikan downvote
                    if (isUpvoted && isDownvoted) {
                      isDownvoted = false;
                      downCount--;
                    }
                  }),
                ),
                Text("$upCount"),
                const SizedBox(width: 10),
                // 3. PERBAIKAN WARNA DOWNVOTE (BIRU) SESUAI SOAL
                IconButton(
                  icon: Icon(
                    Icons.arrow_downward,
                    color: isDownvoted
                        ? const Color.fromARGB(255, 147, 25, 25)
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () => setState(() {
                    isDownvoted = !isDownvoted;
                    isDownvoted ? downCount++ : downCount--;
                    // Logika Bonus: Jika downvote ditekan, matikan upvote
                    if (isDownvoted && isUpvoted) {
                      isUpvoted = false;
                      upCount--;
                    }
                  }),
                ),
                Text("$downCount"),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(post: widget.post),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
