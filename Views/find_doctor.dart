// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:medical/Screens/Widgets/listicons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class find_doctor extends StatelessWidget {
  const find_doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset("lib/icons/back2.png")),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Find Doctor",
          style: GoogleFonts.inter(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        toolbarHeight: 130,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Search Bar
            Center(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 247, 247),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        "lib/icons/search.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    labelText: "Search doctor, drugs, articles...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Top Doctor Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top Doctor",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Category Icons
            const Row(
              children: [
                SizedBox(width: 10),
                listIcons(Icon: "lib/icons/Doctor.png", text: "General"),
                listIcons(Icon: "lib/icons/Lungs.png", text: "Lungs"),
                listIcons(Icon: "lib/icons/Dentist.png", text: "Dentist"),
                listIcons(Icon: "lib/icons/psychology.png", text: "Psychiatrist"),
              ],
            ),

            const Row(
              children: [
                SizedBox(width: 10),
                listIcons(Icon: "lib/icons/covid.png", text: "COVID-19"),
                listIcons(Icon: "lib/icons/injection.png", text: "Vaccination"),
                listIcons(Icon: "lib/icons/cardiologist.png", text: "Cardio"),
              ],
            ),

            const SizedBox(height: 20),

            /// Recommended Doctors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended Doctors",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const DoctorDetails()));
              },
              child: const doctorList(
                  distance: "800m away",
                  image: "lib/icons/male-doctor.png",
                  maintext: "Dr. Adarsh Yadav",
                  numRating: "4.7",
                  subtext: "Cardiologist"),
            ),

            const SizedBox(height: 20),

            /// Your Recent Doctors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Recent Doctors",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// Recent Doctors List
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DoctorCard(
                  image: "lib/icons/male-doctor.png",
                  name: "Dr. Marcus",
                ),
                DoctorCard(
                  image: "lib/icons/female-doctor.png",
                  name: "Dr. Maria",
                ),
                DoctorCard(
                  image: "lib/icons/black-doctor.png",
                  name: "Dr. Luke",
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;

  const DoctorCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.28,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
