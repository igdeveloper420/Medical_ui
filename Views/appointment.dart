import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("lib/icons/back1.png"),
          onPressed: () {
            Navigator.pop(context); // Corrected navigation
          },
        ),
        title: Text(
          "Top Doctors",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Image.asset("lib/icons/more.png"),
              onPressed: () {
                // Add action if needed
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            const doctorList(
              distance: "800m away",
              image: "lib/icons/male-doctor.png",
              maintext: "Dr. Adarsh Yadav",
              numRating: "4.7",
              subtext: "Cardiologist",
            ),
            const SizedBox(height: 10),

            /// Date Section
            _buildInfoSection("Date", "Change"),
            _buildDateTimeRow("Wednesday, Jun 23, 2021 | 10:00 AM", "lib/icons/callender.png"),

            /// Reason Section
            _buildInfoSection("Reason", "Change"),
            _buildReasonRow("Chest pain", "lib/icons/pencil.png"),

            /// Payment Details
            _buildPaymentDetails(),

            /// Payment Method Section
            _buildPaymentMethod(),

            /// Total & Book Button
            _buildTotalAndBookButton(context),
          ],
        ),
      ),
    );
  }

  /// Helper Widgets
  Widget _buildInfoSection(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            action,
            style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeRow(String text, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildIconContainer(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonRow(String text, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildIconContainer(icon),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Divider(color: Colors.black12),
          const SizedBox(height: 10),
          _buildPaymentRow("Consultation", "\$60"),
          _buildPaymentRow("Admin Fee", "\$01.00"),
          _buildPaymentRow("Additional Discount", "-"),
          const SizedBox(height: 10),
          _buildPaymentRow("Total", "\$61.00", isTotal: true),
          const SizedBox(height: 10),
          const Divider(color: Colors.black12),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: isTotal ? 15.sp : 14.sp,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
                color: isTotal ? Colors.black87 : Colors.black54),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(fontSize: 16.sp, color: isTotal ? Colors.green[700] : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Method", style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Visa",
                    style: GoogleFonts.inter(fontSize: 17.sp, fontWeight: FontWeight.w600, color: Colors.blue[900]),
                  ),
                  Text("Change", style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAndBookButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total", style: GoogleFonts.inter(fontSize: 15.sp, color: Colors.grey[700])),
              const SizedBox(height: 5),
              Text("\$61", style: GoogleFonts.inter(fontSize: 19.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Add Booking Logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Text("Book", style: GoogleFonts.poppins(fontSize: 15.sp, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(String iconPath) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(image: AssetImage(iconPath), filterQuality: FilterQuality.high),
      ),
    );
  }
}
