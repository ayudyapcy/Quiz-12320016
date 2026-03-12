import 'package:flutter/material.dart';
import 'package:quiz_123230016/models/post.dart';

class DetailPage extends StatelessWidget {

  final Post post;

  const DetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),

      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Colors.pink,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

               ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    post.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                 Text(
                  post.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 10),

                const Divider(),

                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  post.content,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 20),

                const Divider(),

                const Text(
                  "Komentar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                ...post.comments.map(
                  (comment) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    color: const Color.fromARGB(255, 254, 139, 177),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(comment),
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