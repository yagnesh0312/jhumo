import 'package:flutter/material.dart';
import 'package:jhumo/components/glass_container.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Jhumo",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 40),
              Text(
                "Check your email for code",
                style: TextStyle(fontSize: 15,color: Colors.white54),
              ),
              SizedBox(height: 40),
              TextField(  textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(hintText: "Enter Code"),
              ),
              SizedBox(height: 30),
              GlassContainer(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Verfiy",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
