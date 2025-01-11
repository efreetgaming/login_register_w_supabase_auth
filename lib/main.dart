import 'package:flutter/material.dart';
import 'package:login_register_w_supabase_auth/utils/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  
  await Supabase.initialize(
    url: "https://pjtyvtugfrxmeklygscv.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqdHl2dHVnZnJ4bWVrbHlnc2N2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU0NzYzMDQsImV4cCI6MjA1MTA1MjMwNH0.GVAkQlguB0hm4nPDstTkhv_ujlqdLXelT51RiJOKzbE"
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