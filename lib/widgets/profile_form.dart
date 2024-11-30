import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class ProfileForm extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialLocation;
  final Function(String) onNameChanged;
  final Function(String) onEmailChanged;
  final Function(String) onLocationChanged;
  final Function(String) onStreetChanged;
  final Function(String) onCityChanged;
  final Function(String) onPincodeChanged;

  const ProfileForm({
    super.key,
    required this.initialName,
    required this.initialEmail,
    required this.initialLocation,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onLocationChanged,
    required this.onStreetChanged,
    required this.onCityChanged,
    required this.onPincodeChanged,
  });

  @override
  _ProfileFormState createState() => _ProfileFormState();
}
class _ProfileFormState extends State<ProfileForm> {
  String phoneNumber = '';
  String street = '';
  String city = '';
  String pincode = '';

  @override
  void initState() {
    super.initState();
    // Initialize Firebase and fetch phone number
    _fetchPhoneNumber();
  }

  // Fetch phone number from FirebaseAuth user
  void _fetchPhoneNumber() async {
    firebase.User? fbUser = firebase.FirebaseAuth.instance.currentUser;

    if (fbUser != null) {
      // Print the authentication provider data for debugging
      print("User Provider Data: ${fbUser.providerData}");
      print("User Email: ${fbUser.email}");
      String? phoneNumber = fbUser.phoneNumber;
      print("User Phone Number: $phoneNumber");

      // Check if the user has a phone number
      if (fbUser.phoneNumber != null && fbUser.phoneNumber!.isNotEmpty) {
        setState(() {
          phoneNumber = fbUser.phoneNumber!;
        });
      } else {
        // Handle case where phone number is not available
        setState(() {
          phoneNumber = 'Not Available'; // Or leave empty string if preferred
        });
      }
    } else {
      // Handle case where the user is not logged in
      setState(() {
        phoneNumber = 'User not logged in';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormField(
              label: 'Name',
              initialValue: widget.initialName,
              onChanged: widget.onNameChanged,
            ),
            const SizedBox(height: 10),
            _buildFormField(
              label: 'Email',
              initialValue: widget.initialEmail,
              onChanged: widget.onEmailChanged,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 13),
            _buildFormField(
              label: 'Location',
              initialValue: widget.initialLocation,
              onChanged: widget.onLocationChanged,
            ),
            const SizedBox(height: 4),
            _buildTextField('Street name and Locality', onChanged: (value) {
              setState(() {
                street = value;
              });
            }),
            const SizedBox(height: 4),
            _buildTextField('City', onChanged: (value) {
              setState(() {
                city = value;
              });
            }),
            const SizedBox(height: 4),
            _buildTextField('Pincode', onChanged: (value) {
              setState(() {
                pincode = value;
              });
            }),
            const SizedBox(height: 10),
            _buildFormField(
              label: 'Phone Number',
              initialValue: phoneNumber,
              onChanged: (value) {},
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _updateProfile(
                    context,
                    widget.initialEmail,
                    widget.initialName,
                    widget.initialLocation,
                    street,
                    city,
                    pincode,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD35400),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3D3D3D),
          ),
        ),
        const SizedBox(height: 15),
        _buildTextField(initialValue, onChanged: onChanged, keyboardType: keyboardType),
      ],
    );
  }

  Widget _buildTextField(String hintText, {required Function(String) onChanged, TextInputType? keyboardType}) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: hintText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xFF969696),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xE6E2E2E2),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Color(0xE6E2E2E2),
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 17,
        ),
      ),
    );
  }

  // Updating profile in Supabase
  void _updateProfile(BuildContext context, String email, String name, String location, String street, String city, String pincode) async {
    final user = Supabase.instance.client;
    firebase.User? fbUser = firebase.FirebaseAuth.instance.currentUser;

    // Debugging: Check if the user is authenticated in both Supabase and Firebase
    print("Supabase user: $user");
    print("Firebase user: $fbUser");

    if (user == null || fbUser == null) {
      print("User is not logged in or authentication failed");
      return;
    }

    final response = await Supabase.instance.client
        .from('customer')
        .upsert({
          'name': name,
          'email': email,
          'address': '$location $street $city $pincode', // Concatenated properly as a string
        });

    if (response.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile: ${response.error?.message}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
    }
  }
}
