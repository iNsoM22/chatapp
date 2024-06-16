import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> signUpUser(
      String email, String username, String password) async {
    try {
      final response = await _supabase.auth.signUp(
          email: email, password: password, data: {'username': username});
      print(email);
      print(username);
      print(password);
      // await _supabase.from('Authentication').insert({
      //   'id': response.user!.id,
      //   'username': username,
      //   'email': email,
      // });

      notifyListeners();
    } catch (e) {
      throw Exception("Failed to sign up user: $e");
    }
  }

  // Function to sign in a user
  Future<void> signInUser(String email, String password) async {
    try {
      final response = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      notifyListeners(); // Notify listeners of state change (user signed in)
    } catch (e) {
      throw Exception("Failed to sign in user: $e");
    }
  }

  Future<void> signOutUser() async {
    try {
      await _supabase.auth.signOut();
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to sign out user: $e");
    }
  }

  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }
}
