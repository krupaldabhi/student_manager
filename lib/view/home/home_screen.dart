import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_manager/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../student/add_attendance.dart';
import '../student/add_new_student.dart';
import '../student/student_details.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Stundet Manager",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        actions: [
          IconButton(onPressed: (){
            Get.to(AddAttendance());
          }, icon: Icon(Icons.add),color: AppColors.white,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:10 ,),
              Row(
                children: [
                  Text("Welcome, Admin!",style: GoogleFonts.poppins(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.bold),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: AppColors.primary,))
                ],
              ),
              Text("Manage Your Student",style: GoogleFonts.poppins(color: AppColors.primary,fontSize: 14),),
              SizedBox(height:10 ,),

              // TODO For Show All Stundet Data
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4), // X, Y
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Student",
                              style: GoogleFonts.poppins(
                                  color: AppColors.white, fontSize: 14),
                            ),
                            Text(
                              "50",
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(Icons.school, color: Colors.white, size: 50),
                      ],
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        // ✅ Present Card
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Today Present",
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "30",
                                  style: GoogleFonts.poppins(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        // ❌ Absent Card
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Today Absent",
                                  style: GoogleFonts.poppins(color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "20",
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              bool isPresent = index % 2 == 0;

              return InkWell(
                onTap: (){
                  Get.to( StudentDetails());
                },
                child: Container(
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

                      // LEFT SIDE (Student Info)
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColors.primary,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Demo Student",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondary,
                                ),
                              ),
                              SizedBox(height: 2),

                              Text(
                                "Roll No : 12",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.grey,
                                ),
                              ),
                              SizedBox(height: 4),

                              InkWell(
                                onTap: (){
                                  _makePhoneCall("1234567890");
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.call,
                                        color: AppColors.primary, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      "7211121353",
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

                      /// RIGHT SIDE (Status Badge)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isPresent
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isPresent ? "Present" : "Absent",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isPresent ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
              // TODO List Of Student


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(AddNewStudent());
          },
      backgroundColor: AppColors.primary,
        child: Icon(Icons.add,color: Colors.white,),
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
