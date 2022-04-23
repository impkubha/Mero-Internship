import 'package:flutter/material.dart';
import 'package:merointernship/data/post.dart';
import 'package:merointernship/utils/remote_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: posts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(posts![index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(posts![index].thumbnailUrl),
                    ),
                  ),
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
