import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Man5.dart';

class Man4 extends StatefulWidget {
  final String phoneNumber;

  Man4({required this.phoneNumber});

  @override
  _Man4State createState() => _Man4State();
}

class _Man4State extends State<Man4> {
  late Timer _timer;
  int _start = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      iconSize: 24,
                    ),
                  ),
                  const Text(
                    'Xác Thực OTP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Một mã xác thực đã được gửi tới sđt:',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.phoneNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA61028),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Pinput(
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        mainAxisAlignment: MainAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                          width: 40,
                          height: 48,
                          textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 40,
                          height: 48,
                          textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFA61028)),
                          ),
                        ),
                        onChanged: (value) {},
                        onCompleted: (pin) {
                          print('OTP entered: $pin');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _start == 0
                        ? () {
                      startTimer();
                      print("OTP resend triggered");
                    }
                        : null,
                    child: const Text(
                      'Gửi lại OTP',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Man5()));
                  },
                  child: const Text(
                    'Lấy mã xác nhận',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
