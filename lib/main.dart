import 'package:flutter/material.dart';
import 'package:login_register_w_supabase_auth/utils/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  
  await Supabase.initialize(
    url: "xxx", 
    anonKey: "xxx"
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(), 
    );
  }
}