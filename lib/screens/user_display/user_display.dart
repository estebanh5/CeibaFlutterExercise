import 'dart:developer';

import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/screens/user_display/widgets/post_view.dart';
import 'package:ceiba_flutter_exercise/services/services.dart';
import 'package:flutter/material.dart';

class UserDisplay extends StatefulWidget {
  final UserData? user;
  const UserDisplay({Key? key, this.user}) : super(key: key);

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {



  final List<Widget> _posts = [];
  bool _loadingPosts = false;

  @override
  void initState() {
    super.initState();


    _loadPosts();
  }


  void _loadPosts () async{

    setState(() {
      _loadingPosts = false;
      _posts.clear();
    });

    List<PostData> postsList = await Services.getPosts(widget.user!.id.toString());

    for(PostData post in postsList) {
      _posts.add(PostView(post: post,));
    }

    setState(() {
      _loadingPosts = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).user),

      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                const SizedBox(height: 20,),

                SizedBox(width: double.infinity,
                child: Text(widget.user!.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),),

                const SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          const WidgetSpan(child: Icon(Icons.phone, color: Colors.green,)),
                          TextSpan(text: " ${widget.user!.phone}", style: const TextStyle(color: Colors.black))

                        ]
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          const WidgetSpan(child: Icon(Icons.email, color: Colors.green,)),

                          TextSpan(text: " ${widget.user!.email}", style: const TextStyle(color: Colors.black))

                        ]
                    ),
                  ),
                )


              ],
            ),)
          ),


          Expanded(
            flex: 2,
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context).posts, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                  )
                ),


                const SizedBox(height: 10,),

                Expanded(
                  child: !_loadingPosts? SingleChildScrollView(
                    child: Column(
                      children: _posts,
                    ),
                  ) : Column(
                    children: const [
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
                          ),
                        ),
                      )
                    ],
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
