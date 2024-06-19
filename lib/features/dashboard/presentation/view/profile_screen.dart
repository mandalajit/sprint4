import 'package:campmart/features/auth/presentation/view/login_view.dart';
import 'package:campmart/features/dashboard/presentation/view/setting_screen.dart';
import 'package:campmart/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Ram Narayan'),
            subtitle: Text('ramnarayan@gmail.com'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('My orders'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to My Orders screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyOrdersScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Shipping addresses'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Shipping Addresses screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ShippingAddressesScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment methods'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Payment Methods screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: const Text('Promocodes'),
            trailing: const Text('You have no applied promocodes'),
            onTap: () {
              // Navigate to Promocodes screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PromocodesScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('My reviews'),
            trailing: const Text('Reviews for 4 items'),
            onTap: () {
              // Navigate to My Reviews screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => MyReviewsScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to Settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logout and navigate to login screen
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()),
                            (route) => false, // Remove all routes
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
