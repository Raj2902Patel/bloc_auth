import 'package:auth_flow/bloc/auth_bloc.dart';
import 'package:auth_flow/bloc/auth_event.dart';
import 'package:auth_flow/bloc/auth_state.dart';
import 'package:auth_flow/pages/auth/loginScreen.dart';
import 'package:auth_flow/utils/constData.dart';
import 'package:auth_flow/widgets/toastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  final GlobalKey<FormState> _registerFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));

              toastDialog(
                context: context,
                message: const Text(
                  "Account Created Successfully!",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                leadingIcon: const Icon(
                  Icons.verified,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                animationDuration: const Duration(seconds: 2),
                displayDuration: const Duration(seconds: 1),
              );
            } else if (state is AuthErrorState) {
              print("Error!");
            }
          },
          builder: (context, state) {
            bool isRegisterPasswordVisible = false;
            bool isRegisterConfirmPasswordVisible = false;

            if (state is AuthLoadingState) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: const CircularProgressIndicator(),
                ),
              );
            }

            if (state is RegisterPasswordVisibilityState) {
              isRegisterPasswordVisible = state.isRegisterPasswordVisible;
            }

            if (state is RegisterConfirmPasswordVisibilityState) {
              isRegisterConfirmPasswordVisible =
                  state.isRegisterConfirmPasswordVisible;
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 60),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Form(
                    key: _registerFormKey,
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
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is a required field";
                            } else if (!NAME_VALIDATION_REGEX.hasMatch(value)) {
                              return "Enter a valid Name";
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.3),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 14.0),
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
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is a required field";
                            } else if (!EMAIL_VALIDATION_REGEX
                                .hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.3),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 14.0),
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
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is a required field";
                            } else if (!PASSWORD_VALIDATION_REGEX
                                .hasMatch(value)) {
                              return "Enter Strong Password!";
                            }
                            return null;
                          },
                          controller: passController,
                          obscureText: isRegisterPasswordVisible ? false : true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.3),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 14.0),
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
                                context.read<AuthBloc>().add(
                                    ToggleRegisterPasswordVisibilityEvent());
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 10.0, bottom: 10.0),
                                child: isRegisterPasswordVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
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
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is a required field";
                            } else if (!PASSWORD_VALIDATION_REGEX
                                .hasMatch(value)) {
                              return "Enter Strong Password!";
                            } else if (value != passController.text) {
                              return "Password Does Not Matched!";
                            }
                            return null;
                          },
                          controller: cpasswordController,
                          obscureText:
                              isRegisterConfirmPasswordVisible ? false : true,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.3),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 14.0),
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
                                context.read<AuthBloc>().add(
                                    ToggleRegisterConfirmPasswordVisibilityEvent());
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, top: 10.0, bottom: 10.0),
                                child: isRegisterConfirmPasswordVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
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
                            onPressed: () {
                              if ((_registerFormKey.currentState?.validate() ??
                                  false)) {
                                _registerFormKey.currentState?.save();
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                          emailController.text,
                                          passController.text,
                                          nameController.text),
                                    );
                              }
                            },
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
                ),
              ],
            );
          },
        ),
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
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
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
