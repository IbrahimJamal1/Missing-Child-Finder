import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:missingchild/core/services/gataddressloca.dart';
import 'package:missingchild/core/services/uploadimage.dart';

class Publish extends StatefulWidget {
  const Publish({super.key});

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {

  TextEditingController childname = TextEditingController();
  TextEditingController childphone = TextEditingController();
  TextEditingController childage = TextEditingController();
  TextEditingController descrip = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  LatLng? location;
  String childStatus = "Missing";
  String personType = "Child";
  DateTime reportDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40, bottom: 35),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff1565C0), Color(0xff42A5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.campaign,
                        size: 38,
                        color: Color(0xff1565C0),
                      ),
                    ),

                    SizedBox(height: 18),

                    Text(
                      "Report Case",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Color.fromARGB(
                                255,
                                208,
                                231,
                                248,
                              ),
                              child: Icon(
                                Icons.person,
                                color: Color(0xff1565C0),
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Personal Information",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        /// Name
                        TextFormField(
                          controller: childname,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            hintText: "Enter child's name",
                            prefixIcon: const Icon(Icons.person_outline),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// Age
                        TextFormField(
                          controller: childage,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Age",
                            hintText: "Enter age",
                            prefixIcon: const Icon(Icons.cake_outlined),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// Phone
                        TextFormField(
                          controller: childphone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Parent Phone",
                            hintText: "01XXXXXXXXX",
                            prefixIcon: const Icon(Icons.phone_outlined),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () async {
                  await pickImage("child");
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 160,

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
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

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
                      const Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blue),
                          SizedBox(width: 10),
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
                          hintText: "Choose Location",
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
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),

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
                      const Row(
                        children: [
                          Icon(Icons.description, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

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
                          prefixIcon: const Padding(
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
                      const Row(
                        children: [
                          Icon(Icons.report, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            "Report Details",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      const Text(
                        "Case Type",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 15),

                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                            value: "Missing",
                            label: Text("Missing"),
                            icon: Icon(Icons.search),
                          ),
                          ButtonSegment(
                            value: "Found",
                            label: Text("Found"),
                            icon: Icon(Icons.check_circle),
                          ),
                          ButtonSegment(
                            value: "Accident",
                            label: Text("Accident"),
                            icon: Icon(Icons.warning_amber),
                          ),
                        ],
                        selected: {childStatus},
                        onSelectionChanged: (value) {
                          setState(() {
                            childStatus = value.first;
                          });
                        },
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Person Type",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 15),

                      SegmentedButton<String>(
                        segments: const [
                          ButtonSegment(
                            value: "Child",
                            label: Text("Child"),
                            icon: Icon(Icons.child_care),
                          ),
                          ButtonSegment(
                            value: "Adult",
                            label: Text("Adult"),
                            icon: Icon(Icons.person),
                          ),
                        ],
                        selected: {personType},
                        onSelectionChanged: (value) {
                          setState(() {
                            personType = value.first;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 35),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
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
