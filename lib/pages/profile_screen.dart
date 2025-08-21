import 'package:flutter/material.dart';
import 'package:karir/layers/custom_bottom_navigation_bar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Form Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _professionalTitleController = TextEditingController();
  final TextEditingController _yearsExperienceController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();

  // Profile Data
  ProfileData profileData = ProfileData();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _fullNameController.text = profileData.fullName;
    _emailController.text = profileData.email;
    _phoneController.text = profileData.phone;
    _locationController.text = profileData.location;
    _professionalTitleController.text = profileData.professionalTitle;
    _yearsExperienceController.text = profileData.yearsExperience;
    _bioController.text = profileData.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          _buildHeader(),
          
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Picture Section
                  _buildProfilePictureSection(),
                  
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPersonalInformationSection(),
                        const SizedBox(height: 32),
                        _buildProfessionalDetailsSection(),
                        const SizedBox(height: 32),
                        _buildSkillsSection(),
                        const SizedBox(height: 32),
                        _buildCVResumeSection(),
                        const SizedBox(height: 32),
                        _buildPortfolioSection(),
                        const SizedBox(height: 32),
                        _buildSocialLinksSection(),
                        const SizedBox(height: 32),
                        _buildPrivacySettingsSection(),
                        const SizedBox(height: 100), // Space for bottom navigation
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

  Widget _buildHeader() {
    return Container(
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
                onPressed: _saveProfile,
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
    );
  }

  Widget _buildProfilePictureSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const SizedBox(height: 60),
        Column(
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
                  child: profileData.profileImageUrl.isEmpty
                      ? Icon(
                          Icons.person_outline,
                          size: 50,
                          color: Colors.grey.shade600,
                        )
                      : ClipOval(
                          child: Image.network(
                            profileData.profileImageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.person_outline,
                              size: 50,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _changeProfilePicture,
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
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              profileData.fullName.isEmpty ? 'Profile name' : profileData.fullName,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersonalInformationSection() {
    return Column(
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
        _buildTextField('Full Name', _fullNameController),
        const SizedBox(height: 16),
        _buildTextField('Email', _emailController, keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        _buildTextField('Phone', _phoneController, keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        _buildTextField('Location', _locationController),
      ],
    );
  }

  Widget _buildProfessionalDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Professional Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildTextField('Professional Title', _professionalTitleController),
        const SizedBox(height: 16),
        _buildTextField('Years of Experience', _yearsExperienceController, keyboardType: TextInputType.number),
        const SizedBox(height: 16),
        _buildTextField('Bio', _bioController, isMultiline: true),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        if (profileData.skills.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: profileData.skills.map((skill) => _buildSkillChip(skill)).toList(),
          ),
        const SizedBox(height: 16),
        
        // Add skill input
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _skillController,
            onSubmitted: _addSkill,
            decoration: const InputDecoration(
              hintText: 'Add a skill and Press Enter',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCVResumeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CV & Resume',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        GestureDetector(
          onTap: _uploadCV,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
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
                  Text(
                    profileData.cvFileName.isEmpty ? 'Upload Your CV/Resume' : profileData.cvFileName,
                    style: const TextStyle(
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
        ),
      ],
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Portfolio & Projects',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        // Projects list
        ...profileData.projects.map((project) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildProjectCard(project),
        )).toList(),
        
        // Add project button
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: _addProject,
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
      ],
    );
  }

  Widget _buildSocialLinksSection() {
    return Column(
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
        
        ...profileData.socialLinks.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildSocialMediaLink(link),
        )).toList(),
        
        Center(
          child: TextButton(
            onPressed: _addSocialLink,
            child: const Text(
              'Add Social Link',
              style: TextStyle(
                color: Color(0xFF785CCB),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacySettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Privacy Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        ...profileData.privacySettings.entries.map((entry) => 
          _buildPrivacyControl(
            entry.key,
            _getPrivacyDescription(entry.key),
            entry.value,
            (value) => setState(() => profileData.privacySettings[entry.key] = value),
          )
        ).toList(),
      ],
    );
  }

  // Helper Widgets
  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isMultiline = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
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
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: isMultiline ? 3 : 1,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF785CCB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF785CCB).withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill,
            style: const TextStyle(
              color: Color(0xFF785CCB),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => _removeSkill(skill),
            child: const Icon(
              Icons.close,
              size: 16,
              color: Color(0xFF785CCB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _editProject(project),
                child: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            project.description,
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

  Widget _buildSocialMediaLink(SocialLink link) {
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
              color: link.color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(link.icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              link.url,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () => _editSocialLink(link),
            child: Icon(
              Icons.edit,
              size: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyControl(
    String title,
    String description,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
              value: value,
              onChanged: onChanged,
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

  // Action Methods
  void _saveProfile() {
    // Update profile data from controllers
    profileData.updateFromControllers(
      fullName: _fullNameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      location: _locationController.text,
      professionalTitle: _professionalTitleController.text,
      yearsExperience: _yearsExperienceController.text,
      bio: _bioController.text,
    );

    // TODO: Implement backend save
    // await ProfileService.saveProfile(profileData);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved successfully!')),
    );
  }

  void _changeProfilePicture() {
    // TODO: Implement image picker
    // final picker = ImagePicker();
    // final image = await picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   setState(() {
    //     profileData.profileImageUrl = image.path;
    //   });
    // }
  }

  void _addSkill(String value) {
    if (value.trim().isNotEmpty && !profileData.skills.contains(value.trim())) {
      setState(() {
        profileData.skills.add(value.trim());
        _skillController.clear();
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      profileData.skills.remove(skill);
    });
  }

  void _uploadCV() {
    // TODO: Implement file picker
    // final result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf', 'doc', 'docx'],
    // );
    // if (result != null) {
    //   setState(() {
    //     profileData.cvFileName = result.files.single.name;
    //     profileData.cvFilePath = result.files.single.path!;
    //   });
    // }
  }

  void _addProject() {
    // TODO: Show dialog to add project
    _showProjectDialog();
  }

  void _editProject(Project project) {
    // TODO: Show dialog to edit project
    _showProjectDialog(project: project);
  }

  void _showProjectDialog({Project? project}) {
    // TODO: Implement project dialog
  }

  void _addSocialLink() {
    // TODO: Show dialog to add social link
    _showSocialLinkDialog();
  }

  void _editSocialLink(SocialLink link) {
    // TODO: Show dialog to edit social link
    _showSocialLinkDialog(link: link);
  }

  void _showSocialLinkDialog({SocialLink? link}) {
    // TODO: Implement social link dialog
  }

  String _getPrivacyDescription(String setting) {
    switch (setting) {
      case 'Profile Visibility':
        return 'Allow others to find and view your profile';
      case 'Contact Information':
        return 'Show your contact details to employers';
      case 'Resume Visibility':
        return 'Allow employers to view your resume';
      case 'Activity Status':
        return 'Show when you were last active';
      default:
        return 'Privacy setting description';
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _professionalTitleController.dispose();
    _yearsExperienceController.dispose();
    _bioController.dispose();
    _skillController.dispose();
    super.dispose();
  }
}

// Data Models
class ProfileData {
  String fullName;
  String email;
  String phone;
  String location;
  String professionalTitle;
  String yearsExperience;
  String bio;
  String profileImageUrl;
  String cvFileName;
  String cvFilePath;
  List<String> skills;
  List<Project> projects;
  List<SocialLink> socialLinks;
  Map<String, bool> privacySettings;

  ProfileData({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.professionalTitle = '',
    this.yearsExperience = '',
    this.bio = '',
    this.profileImageUrl = '',
    this.cvFileName = '',
    this.cvFilePath = '',
    List<String>? skills,
    List<Project>? projects,
    List<SocialLink>? socialLinks,
    Map<String, bool>? privacySettings,
  }) : 
    skills = skills ?? ['JavaScript', 'React', 'Node.js', 'MySQL', 'MongoDB', 'CSS'],
    projects = projects ?? [
      Project('E-commerce Platform', 'Full-stack e-commerce platform with React'),
      Project('Mobile App', 'Cross-platform mobile application'),
    ],
    socialLinks = socialLinks ?? [
      SocialLink('https://johndoe.dev', Icons.language, const Color(0xFF0077B5)),
      SocialLink('https://github.com/johndoe', Icons.code, const Color(0xFF6F42C1)),
      SocialLink('https://linkedin.com/in/johndoe', Icons.work, const Color(0xFF0077B5)),
    ],
    privacySettings = privacySettings ?? {
      'Profile Visibility': true,
      'Contact Information': false,
      'Resume Visibility': false,
      'Activity Status': true,
    };

  void updateFromControllers({
    required String fullName,
    required String email,
    required String phone,
    required String location,
    required String professionalTitle,
    required String yearsExperience,
    required String bio,
  }) {
    this.fullName = fullName;
    this.email = email;
    this.phone = phone;
    this.location = location;
    this.professionalTitle = professionalTitle;
    this.yearsExperience = yearsExperience;
    this.bio = bio;
  }

  // Convert to JSON for backend
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'location': location,
      'professionalTitle': professionalTitle,
      'yearsExperience': yearsExperience,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'cvFileName': cvFileName,
      'cvFilePath': cvFilePath,
      'skills': skills,
      'projects': projects.map((p) => p.toJson()).toList(),
      'socialLinks': socialLinks.map((s) => s.toJson()).toList(),
      'privacySettings': privacySettings,
    };
  }

  // Create from JSON from backend
  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      professionalTitle: json['professionalTitle'] ?? '',
      yearsExperience: json['yearsExperience'] ?? '',
      bio: json['bio'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
      cvFileName: json['cvFileName'] ?? '',
      cvFilePath: json['cvFilePath'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
      projects: (json['projects'] as List?)?.map((p) => Project.fromJson(p)).toList() ?? [],
      socialLinks: (json['socialLinks'] as List?)?.map((s) => SocialLink.fromJson(s)).toList() ?? [],
      privacySettings: Map<String, bool>.from(json['privacySettings'] ?? {}),
    );
  }
}

class Project {
  String title;
  String description;
  String? url;
  String? imageUrl;

  Project(this.title, this.description, {this.url, this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      json['title'] ?? '',
      json['description'] ?? '',
      url: json['url'],
      imageUrl: json['imageUrl'],
    );
  }
}

class SocialLink {
  String url;
  IconData icon;
  Color color;
  String? platform;

  SocialLink(this.url, this.icon, this.color, {this.platform});

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'platform': platform ?? _getPlatformFromUrl(),
      'iconCodePoint': icon.codePoint,
      'colorValue': color.value,
    };
  }

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      json['url'] ?? '',
      IconData(json['iconCodePoint'] ?? Icons.link.codePoint, fontFamily: 'MaterialIcons'),
      Color(json['colorValue'] ?? 0xFF6F42C1),
      platform: json['platform'],
    );
  }

  String _getPlatformFromUrl() {
    if (url.contains('github')) return 'GitHub';
    if (url.contains('linkedin')) return 'LinkedIn';
    if (url.contains('twitter')) return 'Twitter';
    return 'Website';
  }
}