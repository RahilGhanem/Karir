// custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;
  
  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top indicator line
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              // Navigation items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavItem(Icons.work_outline, 'Jobs', 0),
                  _buildBottomNavItem(Icons.event_outlined, 'Events', 1),
                  _buildBottomNavItem(Icons.home_outlined, 'Home', 2),
                  _buildBottomNavItem(Icons.person_outline, 'Profile', 3),
                  _buildBottomNavItem(Icons.chat_bubble_outline, 'Messages', 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;
    
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? const Color(0xFF8B5CF6) : Colors.grey.shade400,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? const Color(0xFF8B5CF6) : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}