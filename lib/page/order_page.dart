import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController
      ();
  final TextEditingController minumanController = TextEditingController
      ();
  final TextEditingController jumlahMakananController =
      TextEditingController();
  final TextEditingController jumlahMinumanController =
      TextEditingController();
  int totalHarga = 0;
  final _formKey = GlobalKey<FormState>();

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0
        ;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0
        ;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 5000);
    });
  }

  @override
  void dispose() {
    makananController.dispose();
    minumanController.dispose();
    jumlahMakananController.dispose();
    jumlahMinumanController.dispose();
    super.dispose();
  }

  Widget _buildInputDecoration({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String errorMessage,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: MainLayout.labelColor),
        prefixIcon: Icon(icon, color: MainLayout.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: MainLayout
              .inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: MainLayout.primaryColor,
              width: 2),
        ),
        filled: true,
        fillColor: MainLayout.inputFillColor,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}