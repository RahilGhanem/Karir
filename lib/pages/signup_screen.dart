import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'check_email_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int? _selectedRoleIndex;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 185, 211), // Base purple background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEBE3F5), // Lighter purple
              borderRadius: BorderRadius.circular(18.0),
            ),
            // --- MODIFICATION ---
            // The 'Center' widget was removed from here to allow the content
            // to be positioned lower on the screen.
            child: SingleChildScrollView(
              child: Container(
                // The white box for the form content.
                // Increased the top margin to push the box down.
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Join Our Community',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Create your account to get started',
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Role Selection
                    const Text(
                      'I am a...',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    _buildRoleCard(
                      icon: Icons.person_outline,
                      title: 'Developer/Job Seeker',
                      subtitle: 'Looking for opportunities and networking',
                      index: 0,
                    ),
                    const SizedBox(height: 12),
                    _buildRoleCard(
                      icon: Icons.business_center_outlined,
                      title: 'Company/Employer',
                      subtitle: 'Hiring talent and posting jobs',
                      index: 1,
                    ),
                    const SizedBox(height: 12),
                    _buildRoleCard(
                      icon: Icons.groups_outlined,
                      title: 'Club/Organization',
                      subtitle: 'Organizing events and building community',
                      index: 2,
                    ),
                    const SizedBox(height: 24),

                    // Form Fields
                    _buildTextField(icon: Icons.person_outline, label: 'Full Name'),
                    const SizedBox(height: 16),
                    _buildTextField(icon: Icons.email_outlined, label: 'Email address'),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      label: 'Password',
                      isVisible: _isPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildPasswordField(
                      label: 'Confirm Password',
                      isVisible: _isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                      },
                    ),
                    const SizedBox(height: 16),

                    // Terms and Conditions
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                              children: [
                                _buildLinkText('Terms of Services', () {/* Handle Tap */}),
                                const TextSpan(
                                  text: ' and ',
                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                                _buildLinkText('Privacy Policy', () {/* Handle Tap */}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Create Account Button (with gradient)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF785CCB), Color(0xFFABA0F9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // After account creation logic, navigate to email verification page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CheckEmailPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign In Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF8A6AED),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for role selection cards
  Widget _buildRoleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required int index,
  }) {
    final bool isSelected = _selectedRoleIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRoleIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBE3F5) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF8A6AED) : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF8A6AED) : Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField({required IconData icon, required String label}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF8A6AED)),
        ),
      ),
    );
  }

  // Helper widget for password fields
  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return TextField(
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF8A6AED)),
        ),
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }

  // Helper for creating tappable link text
  TextSpan _buildLinkText(String text, VoidCallback onTap) {
    return TextSpan(
      text: text,
      style: const TextStyle(
        color: Color(0xFF8A6AED), // Violet color for links
        fontWeight: FontWeight.bold,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }
}