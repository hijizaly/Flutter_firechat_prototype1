import 'package:firechat/auth/auth_service.dart';
import 'package:firechat/components/my_button.dart';
import 'package:firechat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Let Create account for you",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: 'Email',
              controller: _emailController,
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm Password',
              controller: _cPasswordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              buttonName: "Register",
              onTapAction: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void register(context) {
    final _auth = AuthServices();
    if (_passwordController == _cPasswordController) {
      try {
        _auth.signUpWithEmailAndPassword(
            _emailController.text, _cPasswordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password Not Match"),
              ));
    }
  }
}
