import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/widgets/app_button.dart';
import 'package:teste_flutter_firebase/app/core/widgets/app_text_field.dart';
import 'package:teste_flutter_firebase/app/core/widgets/fingerprint_button.dart';
import 'package:teste_flutter_firebase/app/modules/login/ui/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({
    super.key,
    required this.controller,
  });

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightBlue,
                Colors.blueAccent,
                Colors.blue,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 32,
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: widget.controller.navigateRegister,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Hero(
                    tag: 'FlutterLogo',
                    child: FlutterLogo(
                      size: 124,
                    ),
                  ),
                ),
                AppTextField(
                  hint: 'Login',
                  focusNode: widget.controller.nodeEmail,
                  controller: widget.controller.cEmail,
                ),
                SizedBox(height: 24),
                AnimatedBuilder(
                  animation: widget.controller,
                  builder: (context, _) {
                    return AppTextField(
                      hint: 'Password',
                      icon: true,
                      obscure: widget.controller.obscurePass,
                      focusNode: widget.controller.nodePassword,
                      controller: widget.controller.cPassword,
                      onPressed: widget.controller.changeObscurePass,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: widget.controller,
                  builder: (context, _) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: AppButton(
                        textButton: 'ENTRAR',
                        loading: widget.controller.loadLogin,
                        onTap: widget.controller.validateLogin,
                      ),
                    );
                  },
                ),
                SizedBox(height: 60),
                FingerprintButton(
                  onTap: widget.controller.validateFingerprint,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
