import 'package:flutter/material.dart';
import 'package:jhumo/components/glass_container.dart';

class MemojiPage extends StatelessWidget {
  const MemojiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jhumo",
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(height: 40),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6),
                  children: [for (int i = 0; i < 50; i++) Placeholder()],
                ),
                SizedBox(height: 30),
                GlassContainer(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
