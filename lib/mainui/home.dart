import 'package:flutter/material.dart';
import 'package:navigation_route_parsing/main_layout.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic>? recentOrder;

  const HomePage({super.key, this.recentOrder});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home',
      showAppBar: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          tooltip: 'Logout',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to log out?'
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '
                          /login', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            );
          },
        ),
      ],

      child: Container(
        color: MainLayout.backgroundColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello, User!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: MainLayout.textTitleColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Icon(
                          //   Icons.waving_hand_rounded,
                          //   color: MainLayout.accentYellow,
                          //   size: 24,
                          // ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      Text(
                        'What do you want to order today?',
                        style: TextStyle(
                          fontSize: 14,
                          color: MainLayout.textSubtitleColor,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: MainLayout.primaryColor
                        .withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      color: MainLayout.primaryColor,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MainLayout.primaryColor,
                      MainLayout.primaryColor.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: MainLayout.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
    );
  }
}