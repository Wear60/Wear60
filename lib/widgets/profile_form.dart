import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
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
              initialValue: initialName,
              onChanged: onNameChanged,
            ),
            const SizedBox(height: 10),
            _buildFormField(
              label: 'Email',
              initialValue: initialEmail,
              onChanged: onEmailChanged,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 13),
            _buildFormField(
              label: 'Location',
              initialValue: initialLocation,
              onChanged: onLocationChanged,
            ),
            const SizedBox(height: 4),
            _buildTextField('Street name and Locality', onChanged: onStreetChanged),
            const SizedBox(height: 4),
            _buildTextField('City', onChanged: onCityChanged),
            const SizedBox(height: 4),
            _buildTextField('Pincode', onChanged: onPincodeChanged),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
}