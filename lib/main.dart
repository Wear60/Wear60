import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_auth_demo/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart'; // Make sure you import provider package
import '../pages/home_page.dart';
import '../providers/cart_provider.dart'; // Make sure CartProvider is imported

Future<void> main() async {
  // Initialize Flutter bindings and Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  // Initialize Supabase
  // try {
  //   await Supabase.initialize(
  //     url: 'https://yqvlirynskenmryxmjtv.supabase.co',
  //     anonKey: 'your-supabase-key-here',
  //   );
  // } catch (e) {
  //   print("Supabase initialization failed: $e");
  // }

  // Wrap the app with MultiProvider to provide CartProvider to the entire widget tree
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), // CartProvider provided here
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Companies',
      home: HomePage(),
    );
  }
}
