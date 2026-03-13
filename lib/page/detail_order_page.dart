import 'package:flutter/material.dart';
import 'package:navigation_route_parsing/main_layout.dart';

class DetailOrderPage extends StatelessWidget {
  final String makanan;
  final String minuman;
  final String jumlahMakanan;
  final String jumlahMinuman;
  final int totalHarga;

  const DetailOrderPage({
    super.key,
    required this.makanan,
    required this.minuman,
    required this.jumlahMakanan,
    required this.jumlahMinuman,
    required this.totalHarga,
  });

  Widget _buildReceiptRow(String label, String value, {bool isTotal =
      false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? MainLayout.primaryColor : MainLayout
                  .textSubtitleColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 20 : 15,
              fontWeight: isTotal ? FontWeight.w900 : FontWeight.bold,
              color: isTotal ? MainLayout.primaryColor : MainLayout
                  .textTitleColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Order Summary',
      showAppBar: true,
      child: Container(
        color: MainLayout.backgroundColor,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          // Disable overscroll stretch
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(parent:
                ClampingScrollPhysics()), // Smooth tapi gak mantul
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Order Successful!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MainLayout.textTitleColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Here are your order details',
                    style: TextStyle(
                      fontSize: 14,
                      color: MainLayout.textSubtitleColor,
                    ),
                  ),
                  const SizedBox(height: 40),

                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}