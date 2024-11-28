import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  String _name = '';
  String _email = '';
  String _location = '';
  String _street = '';
  String _city = '';
  String _pincode = '';

  @override
  void initState() {
    super.initState();
    if (user != null) {
      _name = user!.displayName ?? '';
      _email = user!.email ?? '';
      // Initialize other fields as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  ProfileHeader(
                    displayName: _name,
                    email: _email,
                    photoURL: user?.photoURL ?? '',
                  ),
                  const SizedBox(height: 20),
                  ProfileForm(
                    initialName: _name,
                    initialEmail: _email,
                    initialLocation: _location,
                    onNameChanged: (value) => setState(() => _name = value),
                    onEmailChanged: (value) => setState(() => _email = value),
                    onLocationChanged: (value) => setState(() => _location = value),
                    onStreetChanged: (value) => setState(() => _street = value),
                    onCityChanged: (value) => setState(() => _city = value),
                    onPincodeChanged: (value) => setState(() => _pincode = value),
                  ),
                  const SizedBox(height: 20),
                  const HomeIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeIndicator extends StatelessWidget {
  const HomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}