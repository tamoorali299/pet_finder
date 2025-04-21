import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.grey[200], // Lighter grey for better contrast with purple
      elevation: 10.0, // Add elevation for better separation
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.home,
            label: "HOME",
            index: 0,
            provider: navigationProvider,
          ),
          _buildNavItem(
            context,
            icon: Icons.chat,
            label: "CHATS",
            index: 1,
            provider: navigationProvider,
          ),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(
            context,
            icon: Icons.favorite,
            label: "MY ADS",
            index: 2,
            provider: navigationProvider,
          ),
          _buildNavItem(
            context,
            icon: Icons.person,
            label: "ACCOUNT",
            index: 3,
            provider: navigationProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required int index,
        required NavigationProvider provider,
      }) {
    final isSelected = provider.currentIndex == index;
    return GestureDetector(
      onTap: () {
        provider.setIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey[600],
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey[600],
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold when selected
            ),
          ),
        ],
      ),
    );
  }
}