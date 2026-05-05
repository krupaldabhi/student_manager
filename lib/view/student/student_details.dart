import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_colors.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(

        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.white,)),
        backgroundColor: AppColors.primary,
        title: Text("Student Details ",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),

      ),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TODO Basic Info
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
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
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Basic Information",style: GoogleFonts.poppins(
                    color: AppColors.black,fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                    Divider(),
                    customText("Student ID", "001"),
                    customText("Student Name", "Demo Student"),
                    customText("Gender", "Male"),
                    customText("Date of Birth", "12 Jan 2010"),
                    customText("Class", "10th"),],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
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
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Parent Details",style: GoogleFonts.poppins(
                    color: AppColors.black,fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                    Divider(),
                    customText("Father Name", "Mr. Rajesh Kumar"),
                    customText("Mother Name", "Mrs. Sunita Kumar"),
                    customText("Parent Contact", "9876543210"),
                    customText("Alternate Contact", "9123456780"),
                    customText(
                        "Address",
                        "Aksharwadi, Waghawadi Road,Bhavnagar - 364001"),

                  ],
                ),
              ),
              SizedBox(height: 10,),
          /*    Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
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
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Attendance Data",style: GoogleFonts.poppins(
                    color: AppColors.black,fontSize: 18,fontWeight: FontWeight.bold
                  ),),
                    Divider(),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),],
                ),
              ),*/
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Attendance Data",
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),

                    // Present & Absent Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        /// ✅ Present Card
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 6),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green, size: 30),
                                SizedBox(height: 5),
                                Text(
                                  "Present",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "20",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 6),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.cancel, color: Colors.red, size: 30),
                                SizedBox(height: 5),
                                Text(
                                  "Absent",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "5", // static value
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );


  }
Widget customText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black)),
          ),
          Expanded(
            flex: 3,
            child: Text(value,
                style: GoogleFonts.poppins(
                    fontSize: 13, color: AppColors.black)),
          ),
        ],
      ),
    );
  }

}
