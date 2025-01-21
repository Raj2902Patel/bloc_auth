import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSecure = true;
  bool isConfirmSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/image/register_bg.svg',
            fit: BoxFit.fill,
            // Adjust fit as needed
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 60),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/image/img_back_arrow.png',
                          height: 20,
                          width: 20,
                        ),
                        const Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff471AA0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Color(0xff471AA0),
                        ),
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: TextStyle(
                            color: const Color(0xff000000).withOpacity(0.3),
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 14.0),
                            child: Image.asset(
                              'assets/image/img_person.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: const Color(0xff000000).withOpacity(0.3),
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 14.0),
                            child: Image.asset(
                              'assets/image/img_email.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        obscureText: isSecure ? true : false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: const Color(0xff000000).withOpacity(0.3),
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 14.0),
                            child: Image.asset(
                              'assets/image/img_password.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 10.0, bottom: 10.0),
                                child: isSecure
                                    ? const Icon(
                                        CupertinoIcons.eye_slash,
                                        size: 30,
                                      )
                                    : Image.asset(
                                        'assets/image/img_eye.png',
                                        height: 30,
                                        width: 30,
                                      )),
                            padding: EdgeInsets.zero,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        obscureText: isConfirmSecure ? true : false,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: const Color(0xff000000).withOpacity(0.3),
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 14.0),
                            child: Image.asset(
                              'assets/image/img_password.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                isConfirmSecure = !isConfirmSecure;
                              });
                            },
                            icon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 10.0, bottom: 10.0),
                                child: isConfirmSecure
                                    ? const Icon(
                                        CupertinoIcons.eye_slash,
                                        size: 30,
                                      )
                                    : Image.asset(
                                        'assets/image/img_eye.png',
                                        height: 30,
                                        width: 30,
                                      )),
                            padding: EdgeInsets.zero,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Color(0xff9747FF),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffBB84E8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                          onPressed: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account ?",
              style: TextStyle(
                color: Color(0xff471AA0),
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Sign In",
                style: TextStyle(
                  color: Color(0xff471AA0),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
