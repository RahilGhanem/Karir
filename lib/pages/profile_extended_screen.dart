import 'package:flutter/material.dart';
import 'package:karir/layers/custom_bottom_navigation_bar.dart';

class ProfileExtendedScreen extends StatefulWidget {
  const ProfileExtendedScreen({Key? key}) : super(key: key);

  @override
  State<ProfileExtendedScreen> createState() => _ProfileExtendedScreenState();
}

class _ProfileExtendedScreenState extends State<ProfileExtendedScreen> {
  final TextEditingController _skillController = TextEditingController();
  List<String> skills = ['JavaScript', 'React', 'Node.js', 'MySQL', 'MongoDB', 'CSS'];
  String selectedSkill = 'JavaScript';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            color: const Color(0xFF785CCB),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Save functionality
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
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
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Skills section
                  const Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Skills chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: skills.map((skill) => _buildSkillChip(skill, skill == selectedSkill)).toList(),
                  ),
                  const SizedBox(height: 16),
                  
                  // Add skill input
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _skillController,
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          setState(() {
                            skills.add(value.trim());
                            _skillController.clear();
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Add a skill and Press Enter',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // CV & Resume section
                  const Text(
                    'CV & Resume',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Upload CV container
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 32,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Upload Your CV/Resume',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'PDF, DOC up to 5MB',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Portfolio & Projects section
                  const Text(
                    'Portfolio & Projects',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Project 1
                  _buildProjectCard(
                    'E-commerce Platform',
                    'Full_stack e_commerce platform with React',
                  ),
                  const SizedBox(height: 12),
                  
                  // Project 2
                  _buildProjectCard(
                    'E-commerce Platform',
                    'Full_stack e_commerce platform with React',
                  ),
                  const SizedBox(height: 20),
                  
                  // Add project button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Add project functionality
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        'Add a Project',
                        style: TextStyle(
                          color: Color(0xFF785CCB),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100), // Space for bottom navigation
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
  
  Widget _buildSkillChip(String skill, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSkill = skill;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF785CCB) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF785CCB) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          skill,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
  Widget _buildProjectCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FF), // Light purple background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 18,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }
}