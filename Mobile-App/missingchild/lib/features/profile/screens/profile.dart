import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC), // الخلفية الموحدة المريحة للتطبيق
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff1E3A8A), // الأزرق الداكن الخاص بالهوية
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), // تأثير تمرير سلس ومريح
        slivers: [
          // الجزء العلوي: بيانات الحساب والغلاف
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // صورة الغلاف (Cover Image)
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/800/400"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // الصورة الشخصية المتداخلة المحدثة
                    Positioned(
                      bottom: -50,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.white, // الإطار الأبيض الخارجي
                          child: CircleAvatar(
                            radius: 59,
                            backgroundColor: Color(0xffF1F5F9),
                            backgroundImage: NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 64), // مسافة كافية لبروز الصورة الشخصية

                // الاسم والبريد الإلكتروني
                const Text(
                  "Ibrahim Gamal",
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "ibrahim@gmail.com",
                  style: TextStyle(
                    color: Color(0xff64748B),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'editprofile');
                    },
                    icon: const Icon(Icons.edit_rounded, size: 18),
                    label: const Text(
                      "Edit Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xff3B82F6),
                      side: const BorderSide(color: Color(0xff3B82F6), width: 1.5),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // عنوان قسم المنشورات الشخصية
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Posts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff1E293B),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),

          
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // صورة البوست
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                "https://picsum.photos/300?random=$index",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // تفاصيل ونصوص البوست
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  index.isEven ? "Missing Child" : "Accident Report",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334155),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: Color(0xffEF4444),
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    const Expanded(
                                      child: Text(
                                        "Quesna, Menoufia",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xff94A3B8),
                                          fontSize: 12,
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
                    ),
                  );
                },
                childCount: 2, // تم ضبطه على رقم تجريبي منسق لجمالية الصفحة
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.82, // تم تعديل النسبة لتعطي مساحة متناسقة ومريحة للصورة مع النصوص
              ),
            ),
          ),
          
          // مسافة سفلية فارغة إضافية لراحة العين عند التمرير لآخر الصفحة
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}