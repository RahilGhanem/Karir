import 'package:flutter/material.dart';
import 'package:karir/layers/custom_bottom_navigation_bar.dart';

class EnhancedProfilePage extends StatefulWidget {
  const EnhancedProfilePage({Key? key}) : super(key: key);

  @override
  State<EnhancedProfilePage> createState() => _EnhancedProfilePageState();
}

class _EnhancedProfilePageState extends State<EnhancedProfilePage> {
  bool visibilityToggle1 = true;
  bool visibilityToggle2 = false;
  bool visibilityToggle3 = false;
  bool visibilityToggle4 = true;
  bool visibilityToggle5 = false;
  bool visibilityToggle6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: const Color(0xFF785CCB),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Expanded(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Social Links',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        _createSocialMediaLink('https://johndoe.dev', Icons.language, const Color(0xFF0077B5)),
                        const SizedBox(height: 12),
                        _createSocialMediaLink('https://github.com/johndoe', Icons.storage, const Color(0xFF6F42C1)),
                        const SizedBox(height: 12),
                        _createSocialMediaLink('https://linkedin.com/in/johndoe', Icons.storage, const Color(0xFF6F42C1)),
                        const SizedBox(height: 12),
                        _createSocialMediaLink('Twitter Profile', Icons.storage, const Color(0xFF6F42C1)),
                        
                        const SizedBox(height: 32),
                        
                        const Text(
                          'Privacy Settings',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle1, (value) => setState(() => visibilityToggle1 = value)),
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle2, (value) => setState(() => visibilityToggle2 = value)),
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle3, (value) => setState(() => visibilityToggle3 = value)),
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle4, (value) => setState(() => visibilityToggle4 = value)),
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle5, (value) => setState(() => visibilityToggle5 = value)),
                        _createPrivacyControl('Profile Visibility', 'Allow others to find and view your profile', visibilityToggle6, (value) => setState(() => visibilityToggle6 = value)),
                        
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomBottomNavigationBar(currentIndex: 3),
        ],
      ),
    );
  }
  
  Widget _createSocialMediaLink(String linkUrl, IconData icon, Color themeColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              linkUrl,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _createPrivacyControl(String mainTitle, String description, bool currentValue, Function(bool) onToggle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainTitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: currentValue,
              onChanged: onToggle,
              activeColor: const Color(0xFF785CCB),
              activeTrackColor: const Color(0xFF785CCB).withOpacity(0.3),
              inactiveThumbColor: Colors.grey.shade300,
              inactiveTrackColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}