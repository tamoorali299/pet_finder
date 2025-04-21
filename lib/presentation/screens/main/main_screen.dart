// // import 'package:flutter/material.dart';
// // import 'package:pet_finder/domain/repositories/auth_repository.dart' show AdModel;
// // import 'package:pet_finder/presentation/providers/auth_provider.dart';
// // import 'package:provider/provider.dart';
// // import 'package:intl/intl.dart'; // For formatting timestamps
// //
// // class MainScreen extends StatelessWidget {
// //   const MainScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final authProvider = Provider.of<AuthProvider>(context);
// //     final user = authProvider.user;
// //
// //     if (user == null) {
// //       return const Center(child: Text('Please log in', style: TextStyle(color: Colors.white)));
// //     }
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF1A1A1A),
// //       appBar: AppBar(
// //         title: const Text('Pet Finder'),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.logout),
// //             onPressed: () async {
// //               await authProvider.logout();
// //               Navigator.pushReplacementNamed(context, '/login');
// //             },
// //           ),
// //         ],
// //       ),
// //       body: StreamBuilder<List<AdModel>>(
// //         stream: authProvider.getAds(user.petCategory!),
// //         builder: (context, snapshot) {
// //           if (snapshot.hasError) {
// //             return const Center(child: Text('Error loading ads', style: TextStyle(color: Colors.white)));
// //           }
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //
// //           final ads = snapshot.data ?? [];
// //
// //           if (ads.isEmpty) {
// //             return const Center(child: Text('No ads found', style: TextStyle(color: Colors.white)));
// //           }
// //
// //           return ListView.builder(
// //             padding: const EdgeInsets.all(16.0),
// //             itemCount: ads.length,
// //             itemBuilder: (context, index) {
// //               final ad = ads[index];
// //               final createdAt = ad.createdAt != null
// //                   ? DateFormat('yyyy-MM-dd – kk:mm').format(ad.createdAt!.toDate())
// //                   : 'Unknown date';
// //
// //               return Card(
// //                 color: Colors.grey[900],
// //                 child: ListTile(
// //                   title: Text(ad.title ?? 'Untitled', style: const TextStyle(color: Colors.white)),
// //                   subtitle: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text('Price: \$${ad.price?.toStringAsFixed(2) ?? '0.00'}', style: const TextStyle(color: Colors.grey)),
// //                       Text('Posted: $createdAt', style: const TextStyle(color: Colors.grey)),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const CreateAdScreen()),
// //           );
// //         },
// //         backgroundColor: Colors.purple,
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
// //
// // class CreateAdScreen extends StatefulWidget {
// //   const CreateAdScreen({super.key});
// //
// //   @override
// //   _CreateAdScreenState createState() => _CreateAdScreenState();
// // }
// //
// // class _CreateAdScreenState extends State<CreateAdScreen> {
// //   final TextEditingController _titleController = TextEditingController();
// //   final TextEditingController _categoryController = TextEditingController();
// //   final TextEditingController _priceController = TextEditingController();
// //
// //   @override
// //   void dispose() {
// //     _titleController.dispose();
// //     _categoryController.dispose();
// //     _priceController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final authProvider = Provider.of<AuthProvider>(context);
// //     final user = authProvider.user;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF1A1A1A),
// //       appBar: AppBar(
// //         title: const Text('Create Ad'),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _titleController,
// //               decoration: InputDecoration(
// //                 labelText: 'Title',
// //                 labelStyle: const TextStyle(color: Colors.white),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.purple),
// //                 ),
// //               ),
// //               style: const TextStyle(color: Colors.white),
// //             ),
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _categoryController,
// //               decoration: InputDecoration(
// //                 labelText: 'Category',
// //                 labelStyle: const TextStyle(color: Colors.white),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.purple),
// //                 ),
// //               ),
// //               style: const TextStyle(color: Colors.white),
// //             ),
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _priceController,
// //               decoration: InputDecoration(
// //                 labelText: 'Price',
// //                 labelStyle: const TextStyle(color: Colors.white),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.white),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   borderSide: const BorderSide(color: Colors.purple),
// //                 ),
// //               ),
// //               style: const TextStyle(color: Colors.white),
// //               keyboardType: TextInputType.number,
// //             ),
// //             const SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 if (_titleController.text.isEmpty ||
// //                     _categoryController.text.isEmpty ||
// //                     _priceController.text.isEmpty) {
// //                   authProvider.setErrorMessage('All fields are required!');
// //                   return;
// //                 }
// //                 await authProvider.createAd(
// //                   title: _titleController.text,
// //                   category: _categoryController.text,
// //                   price: double.parse(_priceController.text),
// //                   ownerId: user!.id!,
// //                 );
// //                 if (authProvider.errorMessage == null) {
// //                   Navigator.pop(context);
// //                 } else {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text(authProvider.errorMessage!)),
// //                   );
// //                 }
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.purple,
// //                 foregroundColor: Colors.white,
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //               child: const Text('Create Ad', style: TextStyle(fontSize: 16)),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:pet_finder/domain/repositories/auth_repository.dart' show AdModel;
// import 'package:pet_finder/presentation/providers/auth_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart'; // For formatting timestamps
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final user = authProvider.user;
//
//     // Redirect to login if user is null
//     if (user == null) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         Navigator.pushReplacementNamed(context, '/login');
//       });
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     // Check if petCategory is null
//     if (user.petCategory == null) {
//       return Scaffold(
//         backgroundColor: const Color(0xFF1A1A1A),
//         appBar: AppBar(
//           title: const Text('Pet Finder'),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.logout),
//               onPressed: () async {
//                 await authProvider.logout();
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//             ),
//           ],
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Please set a pet category to view ads',
//                 style: TextStyle(color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to a screen to set pet category (e.g., profile settings)
//                   Navigator.pushNamed(context, '/settings'); // Assuming settings allows updating pet category
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: const Text('Set Pet Category'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A1A1A),
//       appBar: AppBar(
//         title: const Text('Pet Finder'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               await authProvider.logout();
//               Navigator.pushReplacementNamed(context, '/login');
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<AdModel>>(
//         stream: authProvider.getAds(user.petCategory!), // Safe to use ! since we checked above
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(child: Text('Error loading ads', style: TextStyle(color: Colors.white)));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           final ads = snapshot.data ?? [];
//
//           if (ads.isEmpty) {
//             return const Center(child: Text('No ads found', style: TextStyle(color: Colors.white)));
//           }
//
//           return ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: ads.length,
//             itemBuilder: (context, index) {
//               final ad = ads[index];
//               final createdAt = ad.createdAt != null
//                   ? DateFormat('yyyy-MM-dd – kk:mm').format(ad.createdAt!)
//                   : 'Unknown date';
//
//               return Card(
//                 color: Colors.grey[900],
//                 child: ListTile(
//                   title: Text(ad.title ?? 'Untitled', style: const TextStyle(color: Colors.white)),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price: \$${ad.price?.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey)),
//                       Text('Posted: $createdAt', style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const CreateAdScreen()),
//           );
//         },
//         backgroundColor: Colors.purple,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class CreateAdScreen extends StatefulWidget {
//   const CreateAdScreen({super.key});
//
//   @override
//   _CreateAdScreenState createState() => _CreateAdScreenState();
// }
//
// class _CreateAdScreenState extends State<CreateAdScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _categoryController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final user = authProvider.user;
//
//     // Redirect to login if user is null
//     if (user == null) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         Navigator.pushReplacementNamed(context, '/login');
//       });
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A1A1A),
//       appBar: AppBar(
//         title: const Text('Create Ad'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//                 labelStyle: const TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.purple),
//                 ),
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _categoryController,
//               decoration: InputDecoration(
//                 labelText: 'Category',
//                 labelStyle: const TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.purple),
//                 ),
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _priceController,
//               decoration: InputDecoration(
//                 labelText: 'Price',
//                 labelStyle: const TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: const BorderSide(color: Colors.purple),
//                 ),
//               ),
//               style: const TextStyle(color: Colors.white),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16),
//             if (authProvider.isLoading) const CircularProgressIndicator(),
//             if (authProvider.errorMessage != null)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: Text(
//                   authProvider.errorMessage!,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_titleController.text.isEmpty ||
//                     _categoryController.text.isEmpty ||
//                     _priceController.text.isEmpty) {
//                   authProvider.setErrorMessage('All fields are required!');
//                   return;
//                 }
//                 try {
//                   final price = double.parse(_priceController.text);
//                   await authProvider.createAd(
//                     title: _titleController.text,
//                     category: _categoryController.text,
//                     price: price,
//                     ownerId: user.id, // Safe since user is checked above
//                   );
//                   if (authProvider.errorMessage == null) {
//                     Navigator.pop(context);
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(authProvider.errorMessage!)),
//                     );
//                   }
//                 } catch (e) {
//                   authProvider.setErrorMessage('Invalid price format');
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               child: const Text('Create Ad', style: TextStyle(fontSize: 16)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pet_finder/domain/repositories/auth_repository.dart' show AdModel;
import 'package:pet_finder/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For formatting timestamps

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    // Redirect to login if user is null
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Check if petCategory is null
    if (user.petCategory == null) {
      return Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        appBar: AppBar(
          title: const Text('Pet Finder'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await authProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please set a pet category to view ads',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to a screen to set pet category (e.g., profile settings)
                  Navigator.pushNamed(context, '/settings'); // Assuming settings allows updating pet category
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Set Pet Category'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Pet Finder'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<AdModel>>(
        stream: authProvider.getAds(user.petCategory!), // Safe to use ! since we checked above
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('StreamBuilder error: ${snapshot.error}');
            return const Center(child: Text('Error loading ads', style: TextStyle(color: Colors.white)));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Ensure we handle the case where the stream emits null
          if (!snapshot.hasData) {
            return const Center(child: Text('No ads available', style: TextStyle(color: Colors.white)));
          }

          final ads = snapshot.data ?? [];

          if (ads.isEmpty) {
            return const Center(child: Text('No ads found for this category', style: TextStyle(color: Colors.white)));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: ads.length,
            itemBuilder: (context, index) {
              final ad = ads[index];
              final createdAt = ad.createdAt != null
                  ? DateFormat('yyyy-MM-dd – kk:mm').format(ad.createdAt!.toDate()) // Ensure toDate() for Firestore Timestamp
                  : 'Unknown date';

              return Card(
                color: Colors.grey[900],
                child: ListTile(
                  title: Text(ad.title ?? 'Untitled', style: const TextStyle(color: Colors.white)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${ad.price?.toStringAsFixed(2) ?? '0.00'}', style: const TextStyle(color: Colors.grey)),
                      Text('Posted: $createdAt', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAdScreen()),
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  _CreateAdScreenState createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    // Redirect to login if user is null
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: const Text('Create Ad'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            if (authProvider.isLoading) const CircularProgressIndicator(),
            if (authProvider.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  authProvider.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isEmpty ||
                    _categoryController.text.isEmpty ||
                    _priceController.text.isEmpty) {
                  authProvider.setErrorMessage('All fields are required!');
                  return;
                }
                try {
                  final price = double.parse(_priceController.text);
                  await authProvider.createAd(
                    title: _titleController.text,
                    category: _categoryController.text,
                    price: price,
                    ownerId: user.id, // Safe since user is checked above
                  );
                  if (authProvider.errorMessage == null) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(authProvider.errorMessage!)),
                    );
                  }
                } catch (e) {
                  authProvider.setErrorMessage('Invalid price format');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Create Ad', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}