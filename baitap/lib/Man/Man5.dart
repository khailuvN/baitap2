import 'package:flutter/material.dart';
import 'Man2.dart';

class Man5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResetPasswordScreen(),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const PasswordField({required this.label, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: _toggleVisibility,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          ),
          style: TextStyle(fontSize: 18),
        ),
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
      ],
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text == _confirmPasswordController.text) {
        _errorMessage = null;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Man2()),
        );
      } else {
        _errorMessage = "Mật khẩu không khớp!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/group2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Image(
                    image: AssetImage("lib/assets/logo.png"),
                    width: 42,
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Text(
                    "Đặt lại mật khẩu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  PasswordField(
                    label: 'Mật khẩu mới',
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 16),
                  PasswordField(
                    label: 'Nhập lại mật khẩu mới',
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(height: 8),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA61028),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _validatePasswords,
                      child: const Text(
                        'Tiếp tục',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
