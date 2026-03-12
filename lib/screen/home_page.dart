import 'package:flutter/material.dart';
import 'package:quiz_123230016/models/post.dart';
import 'package:quiz_123230016/screen/detail_page.dart';

class ListPage extends StatefulWidget {

  final String username;

  const ListPage({super.key, required this.username});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  late List<int> upvotes;
  late List<int> downvotes;

  List<bool> isUpvoted = List.generate(dummyPosts.length, (_) => false);
  List<bool> isDownvoted = List.generate(dummyPosts.length, (_) => false);

  @override
  void initState() {
    super.initState();

    upvotes = dummyPosts.map((post) => post.upvotes).toList();
    downvotes = dummyPosts.map((post) => post.downvotes).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFFFF5F8),

      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.pink,
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),

          child: Column(
            children: [

              const SizedBox(height: 20),

              Text(
                "Welcome, ${widget.username}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(

                  itemCount: dummyPosts.length,

                  itemBuilder: (context, index) {

                    final post = dummyPosts[index];

                    return Card(

                      color: const Color(0xFFFFE4EC),

                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(10),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              post.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),

                            const SizedBox(height: 8),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                post.imageUrl,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// TITLE
                            Text(
                              post.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            /// DESCRIPTION
                            Text(post.content),

                            const SizedBox(height: 12),

                            /// VOTE + COMMENT
                            Row(
                              children: [

                                /// UPVOTE BUTTON
                                ElevatedButton.icon(
                                  onPressed: () {

                                    setState(() {

                                      if (isUpvoted[index]) {
                                        upvotes[index]--;
                                        isUpvoted[index] = false;
                                      } else {
                                        upvotes[index]++;
                                        isUpvoted[index] = true;

                                        if (isDownvoted[index]) {
                                          downvotes[index]--;
                                          isDownvoted[index] = false;
                                        }
                                      }

                                    });

                                  },

                                  icon: const Icon(Icons.arrow_upward),

                                  label: Text("Upvote (${upvotes[index]})"),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isUpvoted[index]
                                        ? Colors.orange
                                        : Colors.grey[300],

                                    foregroundColor: Colors.black,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                /// DOWNVOTE BUTTON
                                ElevatedButton.icon(
                                  onPressed: () {

                                    setState(() {

                                      if (isDownvoted[index]) {
                                        downvotes[index]--;
                                        isDownvoted[index] = false;
                                      } else {
                                        downvotes[index]++;
                                        isDownvoted[index] = true;

                                        if (isUpvoted[index]) {
                                          upvotes[index]--;
                                          isUpvoted[index] = false;
                                        }
                                      }

                                    });

                                  },

                                  icon: const Icon(Icons.arrow_downward),

                                  label: Text("Downvote (${downvotes[index]})"),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isDownvoted[index]
                                        ? Colors.blue
                                        : Colors.grey[300],

                                    foregroundColor: Colors.black,

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),

                                const Spacer(),

                                /// COMMENT ICON
                                IconButton(
                                  icon: const Icon(Icons.comment),

                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(post: post),
                                      ),
                                    );

                                  },
                                ),

                              ],
                            ),

                          ],
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