import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_api/models/post_model.dart';
import 'package:flutter_with_api/reposties/post_reposties.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<PostModel>> postList;
  PostRepository postRepository;
  @override
  void initState() {
    postRepository = PostRepository();
    postList = postRepository.postList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: postList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              semanticsLabel: 'Hello',
            ));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: Image.network(
                        data.url,
                        height: 100,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(data.title),
                      subtitle: Text(data.body),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
