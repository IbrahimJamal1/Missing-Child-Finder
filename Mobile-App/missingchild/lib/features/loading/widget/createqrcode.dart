import 'package:ai_safetrack/core/services/qrcode.dart';
import 'package:flutter/material.dart';

Widget floatActionCreateQR(double width, BuildContext context) {
  TextEditingController personname = TextEditingController();
  TextEditingController personphone = TextEditingController();
  TextEditingController personage = TextEditingController();
  TextEditingController description = TextEditingController();

  return FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.qr_code_2, color: Color(0xFF1565C0)),
                SizedBox(width: 10),
                Text("Create QR"),
              ],
            ),

            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  const SizedBox(height: 12),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "Person Name",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "Phone",
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "Age",
                      prefixIcon: const Icon(Icons.cake),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Description",
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text("Cancel"),
              ),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  showQrCode(
                    context,
                    name:personname.text ,
                    phone: personphone.text,
                    age: personage.text,
                    description: description.text,
                  );
                },
                icon: const Icon(Icons.qr_code_2),
                label: const Text("Generate"),
              ),
            ],
          );
        },
      );
    },

    backgroundColor: const Color(0xFF1565C0),
    foregroundColor: Colors.white,
    elevation: 8,
    shape: const CircleBorder(),

    child: const Icon(Icons.qr_code_2, size: 30),
  );
}
