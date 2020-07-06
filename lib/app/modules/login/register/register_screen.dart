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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Registrar'),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Form(
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
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.setEmail,
                  enabled: true,
                  validator: (val) => controller.emailValidator(val),
                ),
                SizedBox(height: 16.0),
                Observer(builder: (_) {
                  return TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      suffixIcon: IconButton(
                        icon: !controller.passwordVisible
                            ? Icon(Icons.visibility)
                            : Icon(
                                Icons.visibility,
                              ),
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                      ),
                    ),
                    obscureText: !controller.passwordVisible,
                    onChanged: controller.setPassowod,
                    enabled: true,
                    validator: controller.passwordValidator,
                  );
                }),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: CustomButton(
                    text: 'Registrar',
                    onTab: () async {
                      if (_formValidatorKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          "name": controller.nameController.text,
                          "email": controller.emailController.text.trim(),
                        };

                        await controller.auth.signUp(
                          userData: userData,
                          password: controller.passwordController.text.trim(),
                        );
                      }
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
