import 'package:flutter/material.dart';
import 'package:login_signup_ui/login_page.dart';
import 'package:login_signup_ui/password_visibility_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _agreedToTerms = false;
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider = Provider.of<PasswordVisibilityProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Create a new account",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Full name',
                        prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Icon(
                              Icons.person_outlined,
                              color: Colors.grey.shade600,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Full name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.grey.shade600,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Phone number',
                        prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Icon(
                              Icons.phone_outlined,
                              color: Colors.grey.shade600,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: _validatePhoneNumber,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: passwordProvider.obscureText,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Icon(
                              Icons.lock_outlined,
                              color: Colors.grey.shade600,
                            )),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordProvider.togglePasswordVisibility();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: Icon(
                              passwordProvider.obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: passwordProvider.obscureText,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        prefixIcon: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1))),
                            child: Icon(
                              Icons.lock_outlined,
                              color: Colors.grey.shade600,
                            )),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordProvider.togglePasswordVisibility();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: Icon(
                              passwordProvider.obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Refer Code:",
                          style: TextStyle(
                              fontSize: screenWidth >= 295 ? 16 : 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: screenWidth >= 295 ? 150 : 125,
                          height: 33,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _referralCodeController,
                            decoration: InputDecoration(
                                hintText: "Enter referral code",
                                hintStyle: TextStyle(
                                    fontSize: screenWidth >= 295 ? 13 : 10),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: screenWidth >= 295 ? 16 : 17),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.grey.shade600,
                            value: _agreedToTerms,
                            onChanged: (bool? value) {
                              setState(() {
                                _agreedToTerms = value ?? false;
                              });
                            }),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text:
                                    'By registering, you are agreeing with our'),
                            TextSpan(
                                text: ' Terms of Use',
                                style: TextStyle(color: Colors.green.shade800)),
                            const TextSpan(text: ' and'),
                            TextSpan(
                                text: ' Privacy',
                                style: TextStyle(color: Colors.green.shade800)),
                          ])),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _agreedToTerms) {
                        } else {
                          // Highlight the lack of agreement to terms
                          if (!_agreedToTerms) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('You must agree to the terms')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or connect with",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    // google facebook and apple sign
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // google button
                        Image.asset(
                          "assets/google.png",
                          height: 25,
                        ),

                        const SizedBox(
                          width: 40,
                        ),

                        // facebook button
                        Image.asset(
                          "assets/facebook.png",
                          height: 25,
                        ),

                        const SizedBox(
                          width: 40,
                        ),

                        // apple button
                        Image.asset(
                          "assets/apple.png",
                          height: 25,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Text(
                  "New to Rebuzz? Register now",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
