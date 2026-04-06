import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/constants/paddings.dart';
import 'package:expence_app/screens/main_screen.dart';
import 'package:expence_app/services/user_services.dart';
import 'package:expence_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  bool _isViewConfirmPassword = true;
  bool _isViewPassword = true;
  bool _isChecked = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late String _enteredName;
  late String _enteredEmail;
  late String _enteredPassword;
  late String _enteredConfermPassword;
  late bool _isPasswordsMatched;

  final _isValidName = RegExp(r'^[A-Za-z ]{3,}$');
  final _isValidEmail = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  final _isValidPassword = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  final _nameErrorMsg =
      'Please enter your full name (letters and spaces only, minimum 3 characters)';
  final _emailErrorMsg = 'Please enter a valid email address (e.g. example@gmail.com)';
  final _passwordErrorMsg =
      'Password must include least 8 characters, numbers, uppercase & lowercase letters';
  final _confirmPasswordErrorMsg =
      'Passwords do not match. Please re-enter your password';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your \npersonal details",
                style: TextStyle(
                  fontSize: 25,
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        _enteredName = _nameController.text;
                        if (!_isValidName.hasMatch(_nameController.text)) {
                          return _nameErrorMsg;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        _enteredEmail = _emailController.text;
                        if (!_isValidEmail.hasMatch(_emailController.text)) {
                          return _emailErrorMsg;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        _enteredPassword = _passwordController.text;
                        if (!_isValidPassword.hasMatch(_passwordController.text)) {
                          return _passwordErrorMsg;
                        }
                        return null;
                      },
                      obscureText: _isViewPassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isViewPassword = !_isViewPassword;
                            });
                          },
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        _enteredConfermPassword = _confirmPasswordController.text;
                        _isPasswordsMatched = _enteredPassword == _enteredConfermPassword;
                        if (!_isPasswordsMatched) {
                          return _confirmPasswordErrorMsg;
                        }
                        return null;
                      },
                      obscureText: _isViewConfirmPassword,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isViewConfirmPassword = !_isViewConfirmPassword;
                            });
                          },
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember Me for the next time",
                    style: TextStyle(fontSize: 18, color: kGrayColor),
                  ),
                  Checkbox(
                    activeColor: kMainColor,
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              InkWell(
                onTap: () async {
                  _formKey.currentState!.validate();

                  if (context.mounted && _isValidPassword.hasMatch(_enteredPassword)) {
                    await UserServices.storeUserDetail(
                      username: _enteredName,
                      email: _enteredEmail,
                      password: _enteredPassword,
                      confirmPassword: _enteredConfermPassword,
                      context: context,
                    );
                  }
                  if (_isValidName.hasMatch(_enteredName) &&
                      _isValidEmail.hasMatch(_enteredEmail) &&
                      _isValidPassword.hasMatch(_enteredPassword) &&
                      _enteredPassword == _enteredConfermPassword) {
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }
                },
                child: CustomButton(buttonName: "Next", buttonColor: kMainColor),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
