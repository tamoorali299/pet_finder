// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/auth_provider.dart';
//
// class AccountScreen extends StatelessWidget {
//   const AccountScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final user = authProvider.user;
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xFF1A1A1A), // Dark background from the screenshot
//         body: Column(
//           children: [
//             // Profile Section
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   // Profile Image (Placeholder)
//                   const CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.yellow,
//                     child: Icon(Icons.person, size: 40, color: Colors.black),
//                   ),
//                   const SizedBox(width: 16),
//                   // User Name and Edit Profile
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           user?.email ?? 'Guest User', // Use email or placeholder
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Navigate to edit profile screen (placeholder)
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text('Edit Profile clicked')),
//                             );
//                           },
//                           child: const Text(
//                             'View and edit profile',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Menu Items
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.remove_red_eye,
//                     title: 'Public Profile',
//                     subtitle: 'See how other view your profile',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Public Profile clicked')),
//                       );
//                     },
//                   ),
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.local_offer,
//                     title: 'Buy Discounted Packages',
//                     subtitle: 'Sell faster, more & at higher margins with packages',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Buy Packages clicked')),
//                       );
//                     },
//                   ),
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.receipt,
//                     title: 'Orders and Billing Info',
//                     subtitle: 'Orders, billing and invoices',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Orders clicked')),
//                       );
//                     },
//                   ),
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.local_shipping,
//                     title: 'Delivery Orders',
//                     subtitle: 'Track your selling or buying delivery orders',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Delivery Orders clicked')),
//                       );
//                     },
//                   ),
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.settings,
//                     title: 'Settings',
//                     subtitle: 'Privacy and manage account',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Settings clicked')),
//                       );
//                     },
//                   ),
//                   _buildMenuItem(
//                     context,
//                     icon: Icons.help,
//                     title: 'Help & Support',
//                     subtitle: 'Help center and legal terms',
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Help & Support clicked')),
//                       );
//                     },
//                   ),
//                   // Logout Item
//                   ListTile(
//                     leading: const Icon(Icons.exit_to_app, color: Colors.white),
//                     title: const Text(
//                       'Logout',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onTap: () async {
//                       await authProvider.logout();
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         '/login',
//                             (route) => false,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(BuildContext context,
//       {required IconData icon,
//         required String title,
//         required String subtitle,
//         required VoidCallback onTap}) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.white),
//       title: Text(
//         title,
//         style: const TextStyle(color: Colors.white),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: const TextStyle(color: Colors.grey),
//       ),
//       trailing: const Icon(Icons.chevron_right, color: Colors.white),
//       onTap: onTap,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.person, size: 40, color: Colors.black),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? user?.email ?? 'Guest User',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/public-profile');
                          },
                          child: const Text(
                            'View and edit profile',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.remove_red_eye,
                    title: 'Public Profile',
                    subtitle: 'See how others view your profile',
                    onTap: () {
                      Navigator.pushNamed(context, '/public-profile');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.local_offer,
                    title: 'Buy Discounted Packages',
                    subtitle: 'Sell faster, more & at higher margins with packages',
                    onTap: () {
                      Navigator.pushNamed(context, '/buy-packages');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.receipt,
                    title: 'Orders and Billing Info',
                    subtitle: 'Orders, billing and invoices',
                    onTap: () {
                      Navigator.pushNamed(context, '/orders-billing');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.local_shipping,
                    title: 'Delivery Orders',
                    subtitle: 'Track your selling or buying delivery orders',
                    onTap: () {
                      Navigator.pushNamed(context, '/delivery-orders');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    subtitle: 'Privacy and manage account',
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.help,
                    title: 'Help & Support',
                    subtitle: 'Help center and legal terms',
                    onTap: () {
                      Navigator.pushNamed(context, '/help-support');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.white),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      await authProvider.logout();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                            (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: onTap,
    );
  }
}