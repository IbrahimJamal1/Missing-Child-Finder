import 'package:ai_safetrack/features/publish/widgets/headerreport.dart';
import 'package:ai_safetrack/features/publish/widgets/personinfo.dart';
import 'package:ai_safetrack/features/publish/widgets/reportdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ai_safetrack/core/services/gataddressloca.dart';
import 'package:ai_safetrack/core/services/uploadimage.dart';

class Publish extends StatefulWidget {
  const Publish({super.key});

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  TextEditingController personname = TextEditingController();
  TextEditingController personphone = TextEditingController();
  TextEditingController personage = TextEditingController();

  TextEditingController descrip = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  LatLng? location;

  String childStatus = "Missing"; //missing, found, accident
  String personType = "Child"; //child or adult
  DateTime reportDate = DateTime.now(); //time of report

  TextEditingController mfSinceController =
      TextEditingController(); //show text of missing since
  DateTime? selectedDateTime; //store the selected date and time

  final GlobalKey<FormState> reportkey = GlobalKey<FormState>();

  final imageService = ImageService(); //object of ImageService class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: reportkey,
          child: Column(
            children: [
              header_report(),
              personInfo(personname, personage, personphone),
              //upload image
              OutlinedButton.icon(
                onPressed: () async {
                  await imageService.pickImage("person");
                  setState(() {});
                },
                icon: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: imageService.personImage != null
                      ? Colors.green.shade100
                      : Colors.blue.shade50,
                  child: Icon(
                    imageService.personImage != null
                        ? Icons.check_circle
                        : Icons.cloud_upload_outlined,
                    color: imageService.personImage != null ? Colors.green : Colors.blue,
                    size: 22.r,
                  ),
                ),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageService.personImage != null
                          ? "Photo Uploaded"
                          : "Upload Person Photo",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      imageService.personImage != null
                          ? "Tap to change the image"
                          : "JPG, PNG or JPEG",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 70.h),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: imageService.personImage != null
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
              ),
              //choose location
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 10.w),
                          Text(
                            "Location",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      TextFormField(
                        controller: locationController,
                        readOnly: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the last seen location';
                          }
                          return null;
                        },
                        onTap: () async {
                          location =
                              await Navigator.pushNamed(context, 'map')
                                  as LatLng?;
                          if (location != null) {
                            String address = await getAddressFromLatLng(
                              location!.latitude,
                              location!.longitude,
                            );
                            locationController.text = address;
                            setState(() {});
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Last Seen Location",
                          prefixIcon: const Icon(Icons.map),
                          suffixIcon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ),
              //decscription
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.description, color: Colors.blue),
                          SizedBox(width: 10.w),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      TextFormField(
                        controller: descrip,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        maxLines: 3,
                        minLines: 2,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText:
                              "Describe the child's appearance, clothes, last seen location, or any helpful details...",
                          alignLabelWithHint: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 70),
                            child: Icon(Icons.description_outlined),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //report detail
              reportDetail(
                context: context,
                selectedDateTime: selectedDateTime,
                mfSinceController: mfSinceController,
                childStatus: childStatus,
                personType: personType,
                onChildStatusChanged: (value) {
                  setState(() {
                    childStatus = value;
                  });
                },
                onPersonTypeChanged: (value) {
                  setState(() {
                    personType = value;
                  });
                },
                onDateChanged: (value) {
                  setState(() {
                    selectedDateTime = value;
                  });
                },
              ),
              SizedBox(height: 18.h),

              ///publish button
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 35),
                child: SizedBox(
                  width: double.infinity.w,
                  height: 58.h,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff1565C0), Color(0xff42A5F5)],
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (reportkey.currentState!.validate()) {
                          if (childStatus == "Accident") {
                            personType = "Accident";
                          }
                        }
                      },
                      icon: const Icon(Icons.publish_rounded, size: 24),
                      label: const Text(
                        "Publish Report",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
