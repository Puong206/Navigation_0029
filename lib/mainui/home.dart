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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:
                          12, vertical: 6),
                      decoration: BoxDecoration(
                        color: MainLayout.accentYellow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'PROMO 50%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Special Discount\nfor Your First Order!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: MainLayout.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Claim Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Text(
                'Top Menu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MainLayout.textTitleColor,
                ),
              ),
              const SizedBox(height: 16),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                        OrderPage()),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: MainLayout.inputFillColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MainLayout
                        .inputBorderColor),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MainLayout.accentOrange.withOpacity(0
                              .1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.restaurant_menu_rounded,
                          color: MainLayout.accentOrange,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start New Order',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: MainLayout.textTitleColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Browse our delicious menu',
                              style: TextStyle(
                                fontSize: 13,
                                color: MainLayout.textSubtitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              if (widget.recentOrder != null) ...[
                Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MainLayout.textTitleColor,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MainLayout
                        .inputBorderColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color:
                              Colors.green),
                          SizedBox(width: 8),
                          Text(
                            'Order Successful',
                            style: TextStyle(fontWeight: FontWeight
                                .bold, fontSize: 16, color: Colors
                                .green),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text('Food: \n${widget
                              .recentOrder!['makanan']}', style:
                              TextStyle(color: MainLayout
                              .textSubtitleColor)),
                          Text('x${widget
                              .recentOrder!['jumlahMakanan']}', style:
                              const TextStyle(fontWeight: FontWeight
                              .bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text('Drink: \n${widget
                              .recentOrder!['minuman']}', style:
                              TextStyle(color: MainLayout
                              .textSubtitleColor)),
                          Text('x${widget
                              .recentOrder!['jumlahMinuman']}', style:
                              const TextStyle(fontWeight: FontWeight
                              .bold)),
                        ],
                      ),
    );
  }
}