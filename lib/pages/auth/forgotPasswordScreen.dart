import 'package:auth_flow/bloc/auth_bloc.dart';
import 'package:auth_flow/bloc/auth_event.dart';
import 'package:auth_flow/bloc/auth_state.dart';
import 'package:auth_flow/pages/auth/loginScreen.dart';
import 'package:auth_flow/utils/constData.dart';
import 'package:auth_flow/widgets/toastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthPasswordResetEmailSentState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                toastDialog(
                  context: context,
                  message: const Text(
                    "Link Send Successfully!",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leadingIcon: const Icon(
                    Icons.info,
                    size: 40,
                    color: Colors.orange,
                  ),
                  animationDuration: const Duration(seconds: 2),
                  displayDuration: const Duration(seconds: 1),
                );
              } else if (state is AuthErrorState) {
                print("Error!");
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: const CircularProgressIndicator(),
                  ),
                );
              }

              return Form(
                key: _forgotPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              const Color(0xff9747FF).withOpacity(0.2),
                          radius: 25,
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter the email address registered with your account. We'll send you a link to reset your password.",
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email Address"),
                        const SizedBox(
                          height: 5,
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
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffBB84E8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {
                              if ((_forgotPasswordFormKey.currentState
                                      ?.validate() ??
                                  false)) {
                                context.read<AuthBloc>().add(
                                      ForgotPasswordEvent(emailController.text),
                                    );
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text("Remember Password?"),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login Here!",
                                style: TextStyle(
                                  color: Color(0xff471AA0),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
