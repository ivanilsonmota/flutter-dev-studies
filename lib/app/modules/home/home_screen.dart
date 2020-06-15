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
        backgroundColor: Colors.deepPurple,
        actions: [],
      ),
      body: Stack(children: [
        Container(
          color: Colors.grey[300],
        ),
        Container(
          color: Colors.white24,
          //height: MediaQuery.of(context).size.height * 0.50,
          child: _postsListBuider(),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Icon(
              Icons.notification_important,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }

  Widget _postsListBuider() {
    return Observer(builder: (_) {
      return controller.postList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(10.0),
              itemCount: controller.postList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      //width: MediaQuery.of(context).size.width * 0.62,
                      child: RaisedButton(
                        color: Colors.amber,
                        child: Container(
                          child: Center(
                            child: ListTile(
                              title: Text(
                                '${controller.postList[index].title}',
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            );
    });
  }
}
