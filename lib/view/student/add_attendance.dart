import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/app_colors.dart';

class AddAttendance extends StatefulWidget {
  const AddAttendance({super.key});

  @override
  State<AddAttendance> createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {

  List<Map<String, dynamic>> students = [
    {
      "name": "Aarav Sharma",
      "rollNo": 101,
      "contact": "9876543210"
    },
    {
      "name": "Priya Patel",
      "rollNo": 102,
      "contact": "9876543211"
    },
    {
      "name": "Rohan Mehta",
      "rollNo": 103,
      "contact": "9876543212"
    },
    {
      "name": "Sneha Verma",
      "rollNo": 104,
      "contact": "9876543213"
    },
    {
      "name": "Karan Joshi",
      "rollNo": 105,
      "contact": "9876543214"
    },
    {
      "name": "Anjali Desai",
      "rollNo": 106,
      "contact": "9876543215"
    },
    {
      "name": "Vikram Singh",
      "rollNo": 107,
      "contact": "9876543216"
    },
    {
      "name": "Neha Kapoor",
      "rollNo": 108,
      "contact": "9876543217"
    },
    {
      "name": "Rahul Yadav",
      "rollNo": 109,
      "contact": "9876543218"
    },
    {
      "name": "Pooja Nair",
      "rollNo": 110,
      "contact": "9876543219"
    },
    {
      "name": "Aditya Rao",
      "rollNo": 111,
      "contact": "9876543220"
    },
    {
      "name": "Meera Iyer",
      "rollNo": 112,
      "contact": "9876543221"
    },
    {
      "name": "Siddharth Jain",
      "rollNo": 113,
      "contact": "9876543222"
    },
    {
      "name": "Kavya Reddy",
      "rollNo": 114,
      "contact": "9876543223"
    },
    {
      "name": "Arjun Malhotra",
      "rollNo": 115,
      "contact": "9876543224"
    },
    {
      "name": "Simran Kaur",
      "rollNo": 116,
      "contact": "9876543225"
    },
    {
      "name": "Yash Thakur",
      "rollNo": 117,
      "contact": "9876543226"
    },
    {
      "name": "Divya Shah",
      "rollNo": 118,
      "contact": "9876543227"
    },
    {
      "name": "Manav Gupta",
      "rollNo": 119,
      "contact": "9876543228"
    },
    {
      "name": "Ishita Roy",
      "rollNo": 120,
      "contact": "9876543229"
    },
  ];
  bool isPresent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
        title: Text(
          "Add Attendance ",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: ListView.builder(

          shrinkWrap: true,
           itemCount: students.length,
            itemBuilder: (context , index )

            {
              var item = students[index];

          return  Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.primary,
                      child: Text(item['rollNo'].toString(),style: GoogleFonts.poppins(fontWeight:FontWeight.bold,color: Colors.white ),),
                    ),
                    SizedBox(width: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                        SizedBox(height: 2),
                        InkWell(
                          onTap: (){
                            _makePhoneCall(
                                item['contact']);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.call,
                                  color: AppColors.primary, size: 14),
                              SizedBox(width: 4),
                              Text(
                                item['contact'],
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // RIGHT SIDE (Status Badge)
                Checkbox(
                  checkColor: Colors.white,
                  activeColor:AppColors.primary ,
                  // fillColor: WidgetStateProperty.resolveWith(getColor),
                  value: isPresent,
                  onChanged: (bool? value) {
                    setState(() {
                      isPresent = value!;
                    });
                  },
                )
              ],
            ),
          );
        }),
      ),
     bottomSheet: Padding(
       padding: EdgeInsets.all(10),
       child: Container(
         width: double.infinity,
         height: 50,
         decoration: BoxDecoration(
           color: AppColors.primary,
           borderRadius: BorderRadius.circular(10),
         ),
         child: Center(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Save Attendacnce",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.white),),
           ),
         ),
       ),
     ),
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
