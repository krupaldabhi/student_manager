import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({super.key});

  @override
  State<AddNewStudent> createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
  TextEditingController rollNoController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController parentContactController = TextEditingController();
  TextEditingController alternateContactController = TextEditingController();
  TextEditingController addressContactController = TextEditingController();
  DateTime? selectedDate;

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
          "Add New Student",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // For Student Rollno
              CustomTextField(labelText: 'Student RollNo: ',
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Student RollN', controller:rollNoController ),
              // Student Name
              CustomTextField(labelText: 'Student Name: ',
                  hintText: 'Enter Student Name', controller:studentNameController ),
                //Gender
              CustomTextField(labelText: 'Gender: ',
                  hintText: 'Enter Gender', controller:genderController ),

              Text(
                "Date Of Birth:",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primary)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: _selectDate,
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'No date selected',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ),



            //Class
              CustomTextField(labelText: 'Class : ',
                  keyboardType: TextInputType.number,
                  hintText: 'Enter Class', controller:dobController ),
           //Father Name
              CustomTextField(labelText: 'Father Name : ',
                  hintText: 'Enter Father Name', controller:fatherNameController ),
          //Mother  Name
              CustomTextField(labelText: 'Mother Name : ',
                  hintText: 'Enter Mother Name', controller:motherNameController ),
          //Parant Contact
              CustomTextField(labelText: 'Parent Contact  : ',
                  hintText: 'Enter Parent Contact',
                  keyboardType: TextInputType.number,
                  controller:parentContactController ),
          //Alternate Contact
              CustomTextField(labelText: 'Alternate Contact  : ',
                  keyboardType: TextInputType.number,
                  hintText: 'Alternate Parent Contact', controller:alternateContactController ),
          //Addrses Contact
              CustomTextField(labelText: 'Address   : ',
                  hintText: 'Enter Address ', controller:alternateContactController ),

              // TODO Button Pressed
              InkWell(
                onTap: (){
                  print("Button Pressed");
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(child: Padding(padding: EdgeInsetsGeometry.all(10),child: Text("Register Student",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomTextField({required String labelText ,
    required String hintText ,
    required  TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.primary),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2006, 1, 1),
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

}
