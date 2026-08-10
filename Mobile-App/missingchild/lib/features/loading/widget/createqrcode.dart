import 'package:ai_safetrack/core/services/qrcode.dart';
import 'package:flutter/material.dart';

Widget floatActionCreateQR(
  double width,
  BuildContext context,
) {
  return FloatingActionButton(
    onPressed: () {
      final personname = TextEditingController();
      final personphone = TextEditingController();
      final personage = TextEditingController();
      final description = TextEditingController();

      showDialog(
        context: context,
        builder: (dialogContext) {
          
          final dialogWidth = width < 400
              ? width * 0.90
              : width * 0.60;

          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),

            title: const Row(
              children: [
                Icon(
                  Icons.qr_code_2,
                  color: Color(0xFF1565C0),
                ),

                SizedBox(width: 10),

                Text(
                  "Create QR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            content: SizedBox(
              width: dialogWidth,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [

                    const SizedBox(height: 8),

                    // Person Name
                    TextField(
                      controller: personname,

                      textInputAction:
                          TextInputAction.next,

                      decoration: InputDecoration(
                        labelText: "Person Name",

                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF1565C0),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Phone
                    TextField(
                      controller: personphone,

                      keyboardType:
                          TextInputType.phone,

                      textInputAction:
                          TextInputAction.next,

                      decoration: InputDecoration(
                        labelText: "Phone",

                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF1565C0),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Age
                    TextField(
                      controller: personage,

                      keyboardType:
                          TextInputType.number,

                      textInputAction:
                          TextInputAction.next,

                      decoration: InputDecoration(
                        labelText: "Age",

                        prefixIcon: const Icon(
                          Icons.cake,
                          color: Colors.blue,
                        ),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF1565C0),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Description
                    TextField(
                      controller: description,

                      maxLines: 3,

                      textInputAction:
                          TextInputAction.done,

                      decoration: InputDecoration(
                        labelText: "Description",

                        prefixIcon: const Icon(
                          Icons.description,
                          color: Colors.blue,
                        ),

                        alignLabelWithHint: true,

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),

                          borderSide:
                              const BorderSide(
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

            actionsPadding:
                const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              15,
            ),

            actions: [

              SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(dialogContext);

                    showQrCode(
                      context,

                      name: personname.text,

                      phone: personphone.text,

                      age: personage.text,

                      description:
                          description.text,
                    );

                    personname.dispose();
                    personphone.dispose();
                    personage.dispose();
                    description.dispose();
                  },

                  icon: const Icon(
                    Icons.qr_code_2,
                  ),

                  label: const Text(
                    "Generate",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF1565C0),

                    foregroundColor:
                        Colors.white,

                    elevation: 2,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },

    // ============================
    // Floating Action Button
    // ============================

    backgroundColor:
        const Color(0xFF1565C0),

    foregroundColor: Colors.white,

    elevation: 8,

    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(18),
    ),

    child: const Icon(
      Icons.qr_code_2,
      size: 30,
    ),
  );
}

