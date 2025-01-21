import 'package:auth_flow/pages/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 62),
                child: Center(
                  child: Image.asset(
                    'assets/image/app_logo.png',
                    height: 129,
                    width: 129,
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              const Text(
                "Sign in",
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
                  hintText: "Email or User Name",
                  hintStyle: TextStyle(
                    color: const Color(0xff000000).withOpacity(0.3),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 14.0),
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
                obscureText: isSecure ? true : false,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: const Color(0xff000000).withOpacity(0.3),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 14.0),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget Password ?",
                    style: TextStyle(
                      color: Color(0xff471AA0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
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
                    "Sign in",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Or sign in With",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xff471AA0),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/image/img_google.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/image/img_facebook.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/image/img_twitter.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/image/img_linkedin.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don’t have account ?",
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                "Sign Up",
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
