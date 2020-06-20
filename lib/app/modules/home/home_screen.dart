import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));

    print(controller.getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
      ),
      body: Container(
        //height: MediaQuery.of(context).size.height * 0.50,
        child: _postsListBuider(),
      ),
    );
  }

  Widget _postsListBuider() {
    return Observer(builder: (_) {
      return controller.postList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.postList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      child: Container(
                        child: ListTile(
                          onTap: () => Modular.to.pushNamed('/post'),
                          title: Text(
                            '${controller.postList[index].title}',
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                );
              },
            );
    });
  }
}
