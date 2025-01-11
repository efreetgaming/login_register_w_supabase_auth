/*

  Auth Gate - Listen to the event of auth state changes

  Not Authenticated -> Login Page
  Authenticated     -> Home Page

*/

import 'package:flutter/material.dart';
import 'package:login_register_w_supabase_auth/pages/login_page.dart';
import 'package:login_register_w_supabase_auth/pages/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  final SupabaseClient _supabase = Supabase.instance.client;

  AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      // Listen to the auth changes
      stream: _supabase.auth.onAuthStateChange, 

      // Route to appropriate page
      builder: (context, snapshot) {
        // loadings
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // checks if theres a valid auth session
        final session = snapshot.hasData ? snapshot.data?.session : null;
        if (session != null) {
          return ProfilePage();
        } else {
          return LoginPage();
        }
      }
    );
  }
}