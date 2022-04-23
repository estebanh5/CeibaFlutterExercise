import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {

  final PostData post;
  const PostView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(width: double.infinity,
          child: Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),),

          const SizedBox(height: 10,),

          SizedBox(
            width: double.infinity,
            child: Text(post.body,),
          )



        ],
      ),),
    );
  }
}
