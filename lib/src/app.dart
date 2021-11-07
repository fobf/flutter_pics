import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await http.get(
      Uri.http("jsonplaceholder.typicode.com", '/photos/$counter'),
    );

    var imageModel = ImageModel.fromJson(
      jsonDecode(response.body),
    );

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Let\'s see some images'),
        ),
      ),
    );
  }
}
