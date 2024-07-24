import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_prac/PostsModal.dart';
class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  List<PostsModal> postList = [];
  Future<dynamic> getPostApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    postList.clear();
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostsModal.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator(),);
                }else{
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postList[index].id.toString()),
                        subtitle:Text(postList[index].title.toString()),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
