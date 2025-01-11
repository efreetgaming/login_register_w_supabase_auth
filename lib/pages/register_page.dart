import 'package:flutter/material.dart';
import 'package:login_register_w_supabase_auth/pages/login_page.dart';
import 'package:login_register_w_supabase_auth/utils/auth_serv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authServive = AuthService();

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();

  // sign up button
  void signUp() async {
    final email = _email.text;
    final pass = _pass.text;
    final confirmPass = _confirmPass.text;

    if (confirmPass != pass) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Don't Match")));
    } else {
      try {
        await authServive.signUpWithEmailPassword(email, pass);

        // pop the profile page
        Navigator.pop(context);
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to register the account: $e")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          // email
          TextField(controller: _email, decoration: InputDecoration(labelText: "email"),),
          // pass
          TextField(controller: _pass, decoration: InputDecoration(labelText: "password"),),
          // confirm password
          TextField(controller: _confirmPass, decoration: InputDecoration(labelText: "confirm password"),),

          const SizedBox(height: 25,), 

          // login button
          ElevatedButton(onPressed: signUp, child: const Text('Register')),

          const SizedBox(height: 25,),

          // register
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
            child: Text("Already have an account? Login now"))
        ],
      ),
    );
  }
}