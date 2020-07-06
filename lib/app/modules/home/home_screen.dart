import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/auth/auth_repository_interface.dart';
import 'package:portfolio/app/modules/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  var firebaseUser = Modular.get<IAuthRepository>();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.black, statusBarIconBrightness: Brightness.light));

    var user = firebaseUser.getCurrentUser().then((user) => user);
    print(user);

    print(controller.getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.authRepository.signOut();
              Modular.to.pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: Container(
        //height: MediaQuery.of(context).size.height * 0.50,
        child: _postsListBuider(),
      ),
    );
  }

  Widget _postsListBuider() {
    return Observer(
      builder: (_) {
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
                            onTap: () => Modular.to.pushNamed('/post', arguments: controller.postList[index]),
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
      },
    );
  }
}
