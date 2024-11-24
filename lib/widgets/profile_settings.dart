import 'package:flutter/material.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 43),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color(0xFF565656),
              ),
            ),
          ),
          const SizedBox(height: 5),
          _buildSettingItem('Manage Accounts'),
          _buildSettingItem('Help Center'),
          _buildSettingItem('Privacy Policy'),
          _buildSettingItem('Logout/Signout'),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF565656),
            ),
          ),
          Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/01eaac8752def97fd7a73d97d3fd3f50efd79ec8f3ac16b1ff91f2f89f5476ae?apiKey=303f4e9c2e3548e9bc5a09fc673fa272&',
            width: 15,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}