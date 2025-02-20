import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Login-Signup/register.dart';

class login_signup extends StatelessWidget {
  const login_signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 212, 20, 90), // Greenish Shade
              Color.fromARGB(255, 251, 176, 59), // Soft White
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            
            // Logo with soft shadow
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("images/logo.png"),
                  filterQuality: FilterQuality.high,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Heading
            Text(
              "Let's Get Started!",
              style: GoogleFonts.poppins(
                fontSize: 22.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 5),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Login to enjoy the features we've provided, and stay healthy.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Login Button
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 190, 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black26,
                  elevation: 6,
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Signup Button
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const RegisterScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color.fromARGB(255, 3, 190, 150)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Sign up",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 3, 190, 150),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
