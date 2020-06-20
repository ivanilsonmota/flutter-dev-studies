import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/modules/login/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState
    extends ModularState<RegisterScreen, RegisterController> {
  @override
  Widget build(BuildContext context) {
    // final _screenWidth = MediaQuery.of(context).size.width;
    // final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome completo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  obscureText: false,
                  onChanged: controller.setName,
                  enabled: true,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  obscureText: false,
                  onChanged: controller.setEmail,
                  enabled: true,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      child: Text('Esqueci minha senha'),
                      onTap: () => Modular.to.pushReplacementNamed('/'),
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  obscureText: true,
                  onChanged: controller.setPassowod,
                  enabled: true,
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: InkWell(
                    child: ButtonTheme(
                      child: Container(
                        width: 400.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                            child: Text(
                          'Registrar',
                          style: GoogleFonts.aclonica(fontSize: 15),
                        )),
                      ),
                    ),
                    onTap: () {
                      Modular.to.pushReplacementNamed('/');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
