import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/post/post_controller.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends ModularState<PostScreen, PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
        actions: [],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Post $index'),
              subtitle: Text('Description $index'),
              onTap: () => null,
            );
          },
        ),
      ),
    );
  }
}
