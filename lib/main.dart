
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
  try {
    await Supabase.initialize(
      url:'https://yqvlirynskenmryxmjtv.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlxdmxpcnluc2tlbm1yeXhtanR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI2MTQ1MjUsImV4cCI6MjA0ODE5MDUyNX0.DtfkIu2oFOg-93yJG5ygtapd5IpG59_d8Bd_ad7vOtA',
    );
  } catch (e) {
    print("Supabase initialization failed: $e");
  }



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


