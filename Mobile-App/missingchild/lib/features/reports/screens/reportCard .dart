import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:missingchild/core/services/callphone.dart';
import 'package:missingchild/core/services/gataddressloca.dart';
import 'package:missingchild/core/services/qrcode.dart';

class ReportCard extends StatelessWidget {
  //user info
  final String reporterName;
  final String reporterImage;
  final String reportDate;
  //repot info
  final String image;
  final String status;
  final String description;
  final String childName;
  final String age;
  final String phone;
  final String locationName;
  final LatLng location;
  final VoidCallback? onCall;

  const ReportCard({
    super.key,
    required this.reporterName,
    required this.reporterImage,
    required this.reportDate,
    
    required this.image,
    required this.childName,
    required this.status,
    required this.description,
    required this.age,
    required this.phone,
    required this.locationName,
    required this.location,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(reporterImage),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reporterName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        reportDate,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: onCall ?? () {
                      makePhoneCall(phone);
                    },
                    icon: const Icon(Icons.phone, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

          // Child Image
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: AspectRatio(
                    aspectRatio: 16 / 10,

                    child: Image.network(
                      image,
                      fit: BoxFit.cover,

                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 50,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 15,
                right: 30,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),

                  decoration: BoxDecoration(
                    color: status == "Missing" ? Colors.red : Colors.green,

                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xff475569),
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        title: "Age",
                        value: age,
                        icon: Icons.cake,
                        iconColor: Colors.blue,
                        bgColor: const Color(0xffEFF6FF),
                      ),
                    ),

                    const SizedBox(width: 12),
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getAddressFromLatLng(
                          location.latitude,
                          location.longitude,
                        ),
                        builder: (context, snapshot) {
                          String address = "Loading...";

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            address = snapshot.data ?? "Unknown location";
                          }

                          return InfoCard(
                            title: "Location",
                            value: address,
                            icon: Icons.location_on,
                            iconColor: Colors.red,
                            bgColor: const Color(0xffFEF2F2),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "map",
                                arguments: location,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,

                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Share"),
                                  content: const Text(
                                    "Are you sure you want to share?",
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        // هنا تحط كود المشاركة
                                      },
                                      child: const Text("Share"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.share),

                          label: const Text("Share"),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,

                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 50,

                        child: ElevatedButton.icon(
                          onPressed: () async {
                            showQrCode(
                              context,
                              childId: reporterName,
                              name: childName,
                              phone:phone ,
                              age: age,
                              status: status,
                              description: description,
                              location: await getAddressFromLatLng(
                                location.latitude,
                                location.longitude,
                              ),
                            );
                          },

                          icon: const Icon(Icons.qr_code),

                          label: const Text("QR Code"),

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,

                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        constraints: const BoxConstraints(minHeight: 75),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: iconColor.withOpacity(.15), blurRadius: 8),
                ],
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff64748B),
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1E293B),
                    ),
                  ),
                ],
              ),
            ),

            if (onTap != null)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xff94A3B8),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
