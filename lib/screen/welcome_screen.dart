import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';
import '../constants/fontSize.dart';
import '../constants/fontWeights.dart';
import '../constants/radius.dart';
import '../constants/spaces.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SingleChildScrollView(
          //   child:
          Stack(
        children: [
          Container(
            // constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/smokeBack.jpg'),
              ),
            ),
          ),
          Opacity(
            opacity: 0.85,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color.fromARGB(255, 39, 39, 39).withOpacity(0.6),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.4, 0.6, 0.9],
              )),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(right: 25),
                    child: SizedBox(
                      height: 32,
                      width: 70,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius_5)),
                            // side: BorderSide(
                            //     color: Color.fromARGB(255, 224, 93, 22), width: 2)
                          ),
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: size_7,
                              fontWeight: FontWeight.bold,
                              color: buttonTextColor,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(bottom: 15, left: 30),
                        child: Text(
                          'Welcome to',
                          style: GoogleFonts.roboto(
                              color: blueTitleColor,
                              fontSize: size_18,
                              fontWeight: boldWeight),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(bottom: 10, left: 30),
                        child: Text(
                          'DreamStoreal',
                          style: GoogleFonts.roboto(
                              color: lightBlue,
                              fontSize: size_16,
                              fontWeight: boldWeight),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(bottom: 5, left: 30),
                        child: Text(
                          'Shop for artworks at minimum cost',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'and order personalised works',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                          indent: 44,
                          endIndent: 17,
                        )),
                        Text(
                          "  Login  ",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                          indent: 17,
                          endIndent: 44,
                        )),
                      ]),
                  const SizedBox(
                    height: 23,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: darkGreyColor.withOpacity(0.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.black, width: 1),
                              ),
                              hintText: "Email"
                              // border: BorderSide(color: Colors.black,width: 1),
                              ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _controllerName,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: darkGreyColor.withOpacity(0.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.black, width: 1),
                              ),
                              hintText: "Password"
                              // border: BorderSide(color: Colors.black,width: 1),

                              ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _controllerPass,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(right: 120, left: 120),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor.withOpacity(0.3),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  side:
                                      const BorderSide(color: Colors.white, width: 1)),
                              onPressed: () {},
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: size_9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.roboto(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 120,
                    endIndent: 120,
                    thickness: 5,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // )
    );
  }
}
