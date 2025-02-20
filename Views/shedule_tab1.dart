// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical/Screens/Widgets/shedule_card.dart';

class shedule_tab1 extends StatelessWidget {
  const shedule_tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  shedule_card(
                    confirmation: "Confirmed",
                    mainText: "Dr. Adarsh Yadav",
                    subText: "Cardiologist", // Long text
                    date: "26/06/2022",
                    time: "10:30 AM",
                    image: "lib/icons/male-doctor.png",
                  ),
                  const SizedBox(height: 40),
                  shedule_card(
                    confirmation: "Confirmed",
                    mainText: "Dr. Adarsh Yadav",
                    subText: "Heart Specialist with 10+ years of experience", // Another long text
                    date: "26/06/2022",
                    time: "2:00 PM",
                    image: "lib/icons/female-doctor2.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
