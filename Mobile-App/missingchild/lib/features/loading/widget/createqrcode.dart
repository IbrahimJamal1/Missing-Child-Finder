import 'package:ai_safetrack/core/helpfunc/validationinput.dart';
import 'package:ai_safetrack/core/services/qrcode.dart';
import 'package:flutter/material.dart';

Widget floatActionCreateQR(double width, BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (dialogContext) => CreateQrDialog(width: width),
      );
    },
    backgroundColor: const Color(0xFF1565C0),
    foregroundColor: Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: const Icon(Icons.qr_code_2, size: 30),
  );
}

class CreateQrDialog extends StatefulWidget {
  final double width;

  const CreateQrDialog({super.key, required this.width});

  @override
  State<CreateQrDialog> createState() => _CreateQrDialogState();
}

class _CreateQrDialogState extends State<CreateQrDialog> {
  final qrkey = GlobalKey<FormState>();
  late final TextEditingController personname;
  late final TextEditingController personphone;
  late final TextEditingController personage;
  late final TextEditingController description;
  late final TextEditingController reporterame;

  @override
  void initState() {
    super.initState();
    personname = TextEditingController();
    personphone = TextEditingController();
    personage = TextEditingController();
    description = TextEditingController();
    reporterame = TextEditingController();
  }

  @override
  void dispose() {
    personname.dispose();
    personphone.dispose();
    personage.dispose();
    description.dispose();
    reporterame.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dialogWidth = widget.width < 400
        ? widget.width * 0.90
        : widget.width * 0.60;

    return Form(
      key: qrkey,
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        title: const Row(
          children: [
            Icon(Icons.qr_code_2, color: Color(0xFF1565C0)),
            SizedBox(width: 10),
            Text("Create QR", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: SizedBox(
          width: dialogWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                TextFormField(
                  controller: personname,
                  validator: ValidationInput().validationName,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Person Name",
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF1565C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: reporterame,
                  validator: ValidationInput().validationName,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Reporter Name",
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF1565C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: personphone,
                  validator: ValidationInput().phoneValidation,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF1565C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: personage,
                  validator: ValidationInput().ageValidation,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Age",
                    prefixIcon: const Icon(Icons.cake, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF1565C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: description,
                  validator: ValidationInput().emptyValidation,
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Description",
                    prefixIcon: const Icon(
                      Icons.description,
                      color: Colors.blue,
                    ),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF1565C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton.icon(
              onPressed: () {
                if (qrkey.currentState!.validate()) {
                  final nav = Navigator.of(context);
                  final name = personname.text;
                  final phone = personphone.text;
                  final age = personage.text;
                  final desc = description.text;
                  final repName = reporterame.text;

                  nav.pop();

                  showQrCode(
                    nav.context,
                    name: name,
                    phone: phone,
                    age: age,
                    description: desc,
                    reporterName: repName,
                  );
                }
              },
              icon: const Icon(Icons.qr_code_2),
              label: const Text(
                "Generate",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
