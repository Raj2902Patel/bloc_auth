import 'package:auth_flow/bloc/auth_bloc.dart';
import 'package:auth_flow/bloc/auth_event.dart';
import 'package:auth_flow/bloc/auth_state.dart';
import 'package:auth_flow/pages/auth/forgotPasswordScreen.dart';
import 'package:auth_flow/pages/auth/registerScreen.dart';
import 'package:auth_flow/pages/homePage.dart';
import 'package:auth_flow/utils/constData.dart';
import 'package:auth_flow/widgets/toastWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              } else if (state is AuthErrorState) {
                toastDialog(
                  context: context,
                  message: const Text(
                    "Invalid Credentials!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leadingIcon: const Icon(
                    Icons.error,
                    size: 40,
                    color: Colors.red,
                  ),
                  animationDuration: const Duration(seconds: 2),
                  displayDuration: const Duration(seconds: 1),
                );
              }
            },
            builder: (context, state) {
              bool isPasswordVisible = false;

              if (state is AuthLoadingState) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: const CircularProgressIndicator(),
                  ),
                );
              }

              if (state is PasswordVisibilityState) {
                isPasswordVisible = state.isPasswordVisible;
              }

              return Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: Center(
                        child: Image.asset(
                          'assets/image/img_authGuard.png',
                          height: 129,
                          width: 129,
                          color: const Color(0xffBB84E8),
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
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is a required field";
                        } else if (!EMAIL_VALIDATION_REGEX.hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email or User Name",
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
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is a required field";
                        } else if (!PASSWORD_VALIDATION_REGEX.hasMatch(value)) {
                          return "Enter Strong Password!";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: isPasswordVisible ? false : true,
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
                            context
                                .read<AuthBloc>()
                                .add(TogglePasswordVisibilityEvent());
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(
                                right: 15.0, top: 10.0, bottom: 10.0),
                            child: isPasswordVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(
                              color: Color(0xff471AA0),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
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
                          ),
                        ),
                        onPressed: () {
                          if ((_loginFormKey.currentState?.validate() ??
                              false)) {
                            context.read<AuthBloc>().add(
                                  LoginEvent(emailController.text,
                                      passwordController.text),
                                );
                          } else {}
                        },
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
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(GoogleLoginRequested());
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: const Color(0xffFFFFFF),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/image/img_google.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text("Sign in with Google"),
                                        )
                                      ],
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
              );
            },
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
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                _loginFormKey.currentState!.reset();
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
