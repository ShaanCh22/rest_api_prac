import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rest_api_prac/ProductModal.dart';

class LastExample extends StatefulWidget {
  const LastExample({super.key});

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {

  Future<ProductModal> getProductApi()async{
    final response= await http.get(Uri.parse('https://webhook.site/ab5379ee-30ee-4c2e-a0fb-5db1c9988347'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return ProductModal.fromJson(data);
    }else{
      return ProductModal.fromJson(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Screen'),
      ),
      body:Column(
        children: [
          Container(
            height: 200,
            child: FutureBuilder<ProductModal>(
              future: getProductApi(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.data?[1].images?.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          // height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(snapshot.data!.data![1].images![position].url.toString()),
                            )
                          ),
                        ),
                      );
                    },
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        ],
      )
    );
  }
}
