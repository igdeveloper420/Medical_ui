import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class message_all_widget extends StatelessWidget {
  final String Maintext;
  final String subtext;
  final String image;
  final String time;
  final String message_count;

  const message_all_widget({
    super.key,
    required this.Maintext,
    required this.subtext,
    required this.image,
    required this.message_count,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Profile Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Text Content (Main + Sub)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Maintext,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: double.infinity, // Ensures it doesn't overflow
                        child: Text(
                          subtext,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54,
                          ),
                          maxLines: 1, // Prevents overflow
                          overflow: TextOverflow.ellipsis, // Adds "..." if too long
                        ),
                      ),
                    ],
                  ),
                ),

                // Time & Message Count
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (message_count != "0")
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 2, 134, 117),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          message_count,
                          style: const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
