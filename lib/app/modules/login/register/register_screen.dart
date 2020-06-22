import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/login/register/register_controller.dart';
import 'package:portfolio/app/widgets/custom_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ModularState<RegisterScreen, RegisterController> {
  final _formValidatorKey = GlobalKey<FormState>();

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
        child: Observer(
          builder: (ctx) {
            return Form(
              key: _formValidatorKey,
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
                      validator: controller.nameValidator,
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
                      validator: (val) => controller.emailValidator(val),
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
                      validator: controller.passwordValidator,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: CustomButton(
                        text: 'Registrar',
                        onTab: () {
                          if (_formValidatorKey.currentState.validate()) {
                            Modular.to.pushReplacementNamed('/');

                            Scaffold.of(ctx).showSnackBar(
                              SnackBar(
                                content: Text('Dados incorretos. Verifique e tente novamente!'),
                                duration: Duration(seconds: 2),
                                elevation: 0,
                                backgroundColor: Colors.red[300],
                              ),
                            );
                          } else {
                            Scaffold.of(ctx).showSnackBar(
                              SnackBar(
                                content: Text('Dados incorretos. Verifique e tente novamente!'),
                                duration: Duration(seconds: 2),
                                elevation: 0,
                                backgroundColor: Colors.red[300],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
