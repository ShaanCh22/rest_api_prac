import 'package:flutter/material.dart';
import 'package:rest_api_prac/example_one.dart';
import 'package:rest_api_prac/last_example.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExampleOne()));
              },
              child: const Text('Example one'),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LastExample()));
              },
              child: const Text('Example Two'),
            ),
          ],
        ),
      ),
    );
  }
}
