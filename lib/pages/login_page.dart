import 'package:flutter/material.dart';
import 'package:login_register_w_supabase_auth/pages/register_page.dart';
import 'package:login_register_w_supabase_auth/utils/auth_serv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth state
  final authService = AuthService();

  // text controller for email and password
  final _email = TextEditingController();
  final _pass = TextEditingController();

  // login button pressed
  void login() async {
    final email = _email.text;
    final pass = _pass.text;

    // attempt to login
    try {
      await authService.signInWithEmailPassword(email, pass);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login: $e")));
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          // email
          TextField(controller: _email, decoration: InputDecoration(labelText: "email"),),
          // pass
          TextField(controller: _pass, decoration: InputDecoration(labelText: "password"),),

          const SizedBox(height: 25,), 

          // login button
          ElevatedButton(onPressed: login, child: const Text('login')),

          const SizedBox(height: 25,),

          // register
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
            child: Text("Don't have an account? Sign up"))
        ],
      ),
    );
  }
}