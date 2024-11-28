import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../widgets/category_section.dart';
import '../widgets/curated_section.dart';
import '../widgets/products_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/header_section.dart';
import '../widgets/promotion_banner.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  @override
  void initState() {
    super.initState();
    // Listen for authentication state changes
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Welcome!'),
        actions: [
          if (_user != null)
            GestureDetector(
              onTap: () {
                // Navigate to the profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: _user!.photoURL != null
                      ? NetworkImage(_user!.photoURL!)
                      : const AssetImage('assets/default_avatar.png')
                          as ImageProvider,
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: _handleGoogleSignIn,
            ),
        ],
      ),
      body: _user != null
          ? SingleChildScrollView(
              child: Column(
                children: const [
                  HeaderSection(),
                  BannerSection(),
                  CategorySection(),
                  CuratedSection(),
                  PromotionBanner(),
                  ProductsSection(), // Removed the `const` keyword
                ],
              ),
            )
          : _googleSignInButton(),
    );
  }

  // Google Sign-In button widget
  Widget _googleSignInButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo at the center
          Image.asset(
            'assets/logo.png', // Path to your logo image
            height: 150, // Adjust the size as needed
          ),
          const SizedBox(height: 20), // Spacing between logo and button
          SizedBox(
            height: 50,
            child: SignInButton(
              Buttons.google,
              text: "Sign in with Google",
              onPressed: _handleGoogleSignIn,
            ),
          ),
        ],
      ),
    );
  }

  // Google Sign-In logic for mobile platforms
  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // Sign-in was canceled
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (error) {
      print('Google Sign-In Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-In failed: $error')),
      );
    }
  }

  // Sign-Out logic
  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully signed out')),
      );
    } catch (error) {
      print('Sign-Out Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-Out failed: $error')),
      );
    }
  }
}
