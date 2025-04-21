// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pet_finder/presentation/screens/account_screens/buy_package_screen.dart';
// // import 'package:pet_finder/presentation/screens/main/account_screen.dart';
// // import 'package:pet_finder/presentation/screens/main/delivery_order_screen.dart';
// // import 'package:pet_finder/presentation/screens/account_screens/help_support_screen.dart';
// // import 'package:pet_finder/presentation/screens/account_screens/order_billing%20screen.dart';
// // import 'package:pet_finder/presentation/screens/account_screens/public_profile_screen.dart';
// // import 'package:pet_finder/presentation/screens/account_screens/settings_screen.dart';
// // import 'package:provider/provider.dart';
// // import 'firebase_options.dart';
// // import 'presentation/providers/auth_provider.dart';
// // import 'presentation/screens/auth/login_screen.dart';
// // import 'presentation/screens/auth/sign_up_screen.dart';
// // import 'presentation/screens/main/main_screen.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// //   );
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (_) => AuthProvider(),
// //       child: MaterialApp(
// //         title: 'Pet Finder',
// //         theme: ThemeData(
// //           primarySwatch: Colors.purple,
// //           scaffoldBackgroundColor: const Color(0xFF1A1A1A),
// //           textTheme: const TextTheme(
// //             bodyMedium: TextStyle(color: Colors.white),
// //             bodySmall: TextStyle(color: Colors.grey),
// //           ),
// //         ),
// //         home: const SplashScreen(),
// //         debugShowCheckedModeBanner: false,
// //         routes: {
// //           '/login': (context) => const LoginScreen(),
// //           '/signup': (context) => const SignUpScreen(),
// //           '/main': (context) => const MainScreen(),
// //           '/account': (context) => const AccountScreen(),
// //           '/public-profile': (context) => const PublicProfileScreen(),
// //           '/buy-packages': (context) => const BuyPackagesScreen(),
// //           '/orders-billing': (context) => const OrdersBillingScreen(),
// //           '/delivery-orders': (context) => const DeliveryOrdersScreen(),
// //           '/settings': (context) => const SettingsScreen(),
// //           '/help-support': (context) => const HelpSupportScreen(),
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class SplashScreen extends StatelessWidget {
// //   const SplashScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //
// //     WidgetsBinding.instance.addPostFrameCallback((_) async {
// //       final isLoggedIn = await authProvider.checkAuthStatus();
// //       if (isLoggedIn) {
// //         Navigator.pushReplacementNamed(context, '/main');
// //       } else {
// //         Navigator.pushReplacementNamed(context, '/login');
// //       }
// //     });
// //
// //     return const Scaffold(
// //       body: Center(
// //         child: CircularProgressIndicator(),
// //       ),
// //     );
// //   }
// // }
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:pet_finder/presentation/screens/account_screens/buy_package_screen.dart';
// import 'package:pet_finder/presentation/screens/main/account_screen.dart';
// import 'package:pet_finder/presentation/screens/main/delivery_order_screen.dart';
// import 'package:pet_finder/presentation/screens/account_screens/help_support_screen.dart';
// import 'package:pet_finder/presentation/screens/account_screens/order_billing%20screen.dart';
// import 'package:pet_finder/presentation/screens/account_screens/public_profile_screen.dart';
// import 'package:pet_finder/presentation/screens/account_screens/settings_screen.dart';
// import 'package:provider/provider.dart';
// import 'firebase_options.dart';
// import 'presentation/providers/auth_provider.dart';
// import 'presentation/screens/auth/login_screen.dart';
// import 'presentation/screens/auth/sign_up_screen.dart';
// import 'presentation/screens/main/main_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     runApp(const MyApp());
//   } catch (e) {
//     print('Firebase initialization failed: $e');
//     runApp(const ErrorApp());
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => AuthProvider(),
//       child: MaterialApp(
//         title: 'Pet Finder',
//         theme: ThemeData(
//           primarySwatch: Colors.purple,
//           scaffoldBackgroundColor: const Color(0xFF1A1A1A),
//           textTheme: const TextTheme(
//             bodyMedium: TextStyle(color: Colors.white),
//             bodySmall: TextStyle(color: Colors.grey),
//           ),
//         ),
//         home: const SplashScreen(),
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/login': (context) => const LoginScreen(),
//           '/signup': (context) => const SignUpScreen(),
//           '/main': (context) => const MainScreen(),
//           '/account': (context) => const AccountScreen(),
//           '/public-profile': (context) => const PublicProfileScreen(),
//           '/buy-packages': (context) => const BuyPackagesScreen(),
//           '/orders-billing': (context) => const OrdersBillingScreen(),
//           '/delivery-orders': (context) => const DeliveryOrdersScreen(),
//           '/settings': (context) => const SettingsScreen(),
//           '/help-support': (context) => const HelpSupportScreen(),
//         },
//       ),
//     );
//   }
// }
//
// class ErrorApp extends StatelessWidget {
//   const ErrorApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'Failed to initialize Firebase. Please check your configuration.',
//             style: const TextStyle(color: Colors.red),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       try {
//         final isLoggedIn = await authProvider.checkAuthStatus();
//         if (isLoggedIn) {
//           Navigator.pushReplacementNamed(context, '/main');
//         } else {
//           Navigator.pushReplacementNamed(context, '/login');
//         }
//       } catch (e) {
//         print('SplashScreen error: $e');
//         Navigator.pushReplacementNamed(context, '/login');
//       }
//     });
//
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
import 'dart:async'; // Add this for Timeout
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_finder/presentation/screens/account_screens/buy_package_screen.dart';
import 'package:pet_finder/presentation/screens/main/account_screen.dart';
import 'package:pet_finder/presentation/screens/main/delivery_order_screen.dart';
import 'package:pet_finder/presentation/screens/account_screens/help_support_screen.dart';
import 'package:pet_finder/presentation/screens/account_screens/order_billing%20screen.dart';
import 'package:pet_finder/presentation/screens/account_screens/public_profile_screen.dart';
import 'package:pet_finder/presentation/screens/account_screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/sign_up_screen.dart';
import 'presentation/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    print('Firebase initialization failed: $e');
    runApp(const ErrorApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'Pet Finder',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: const Color(0xFF1A1A1A),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.grey),
          ),
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/main': (context) => const MainScreen(),
          '/account': (context) => const AccountScreen(),
          '/public-profile': (context) => const PublicProfileScreen(),
          '/buy-packages': (context) => const BuyPackagesScreen(),
          '/orders-billing': (context) => const OrdersBillingScreen(),
          '/delivery-orders': (context) => const DeliveryOrdersScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/help-support': (context) => const HelpSupportScreen(),
        },
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Failed to initialize Firebase. Please check your configuration.',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // Add a timeout to prevent infinite loading
        final isLoggedIn = await authProvider.checkAuthStatus().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            print('Auth status check timed out');
            return false; // Default to not logged in
          },
        );
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, '/main');
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      } catch (e) {
        print('SplashScreen error: $e');
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

