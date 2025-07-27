import 'package:flutter/material.dart';
import 'package:karir/layers/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Main content area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      
                      Container(
                        height: 140,
                        width: double.infinity,
                        color: const Color(0xFF785CCB),
                        child: SafeArea(
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
                            ],
                          ),
                        ),
                      ),
                      
                      
                      Positioned(
                        top: 80, 
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            
                            Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 3),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    size: 50,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF785CCB),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Name
                            const Text(
                              'Maroua Souak',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  
                  const SizedBox(height: 80),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Full Name field
                        _buildTextField('Full Name', 'Maroua Souak'),
                        const SizedBox(height: 16),
                        
                        // Email field
                        _buildTextField('Email', ''),
                        const SizedBox(height: 16),
                        
                        // Phone field
                        _buildTextField('Phone', '0777537873'),
                        const SizedBox(height: 16),
                        
                        // Location field
                        _buildTextField('Location', 'Algeria TIARET'),
                        const SizedBox(height: 24),
                        
                        // Professional Details section
                        const Text(
                          'Professional Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Professional Title field
                        _buildTextField('Professional Title', 'Full Stack Developer'),
                        const SizedBox(height: 16),
                        
                        // Years of experience field
                        _buildTextField('Years of experience', '1+year'),
                        const SizedBox(height: 16),
                        
                        // Bio field
                        _buildTextField('Bio', 'HVJSQGHBHFHJQKSSHFKQSHFCSHHJQHCH\nJBGNCBHCNGHBHCDH', isMultiline: true),
                        const SizedBox(height: 80), // Space for bottom navigation
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom navigation bar
          const CustomBottomNavigationBar(currentIndex: 3),
        ],
      ),
    );
  }
  
  Widget _buildTextField(String label, String value, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            initialValue: value,
            maxLines: isMultiline ? 3 : 1,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}