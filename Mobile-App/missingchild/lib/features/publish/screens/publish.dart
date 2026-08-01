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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              header_report(),

              personInfo(personname, personage, personphone),
              //upload image
              GestureDetector(
                onTap: () async {
                  await pickImage("child");
                  setState(() {});
                },
                child: Container(
                  width: double.infinity.w,
                  height: 160.h,

                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  child: imagechild == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.blue.shade50,
                              child: const Icon(
                                Icons.cloud_upload_outlined,
                                size: 35,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Tap to Upload Image",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.file(
                            imagechild!,
                            width: double.infinity.w,
                            height: 200.h,
                            fit: BoxFit.cover,
                          ),
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
                      onPressed: () {},
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
