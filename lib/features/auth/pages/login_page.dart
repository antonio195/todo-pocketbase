import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_pocketbase/features/auth/controller/auth_controller.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController _authController = GetIt.I.get();

  @override
  void initState() {
    _authController.addListener(callback);
    _authController.setContext(context);

    super.initState();
  }

  @override
  void dispose() {
    _authController.removeListener(callback);

    super.dispose();
  }

  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Senha"),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _authController.login(
                  email: _emailController.text,
                  password: _passwordController.text,
                  onSuccess: () {
                    context.router.pushNamed("/home");
                  },
                );
              },
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.router.pushNamed("/register");
              },
              child: Text(
                "Registrar-se",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
