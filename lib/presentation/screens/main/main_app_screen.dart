import 'package:flutter/material.dart';
import 'package:pet_finder/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_provider.dart';
import '../chat_screens/chats_screen.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'my_ads_screen.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  // List of screens corresponding to each navigation tab
  static const List<Widget> _screens = [
    HomeScreen(),
    ChatsScreen(),
    MyAdsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _screens[navigationProvider.currentIndex], // Switch screens based on the current index
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-ad');
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}