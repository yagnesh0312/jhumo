import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jhumo/components/label.dart';
import 'package:jhumo/moduls/controller/theme_controller.dart';
import 'package:jhumo/moduls/model/themer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  var _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Stack(
        children: [
          // Container(
          //   height: Get.height * 0.8,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/red_logo.png"), fit: BoxFit.cover),
          //   ),
          // ),
          // Container(
          //   height: Get.height * 0.8,
          //   decoration: BoxDecoration(
          //       color:
          //           Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9)
          //       // image: DecorationImage(
          //       //     image: AssetImage("assets/red_logo.png"), fit: BoxFit.cover),
          //       ),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Themer.light,
                                border: Border.all(
                                    color: Themer.main,
                                    width: 30,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                boxShadow: [
                                  BoxShadow(
                                      color: Themer.main,
                                      blurRadius: 100,
                                      offset: Offset(0, 10)),
                                  BoxShadow(
                                      color: Themer.main,
                                      blurRadius: 100,
                                      offset: Offset(0, 10)),
                                  BoxShadow(
                                      color: Themer.main,
                                      blurRadius: 100,
                                      offset: Offset(0, 10)),
                                ],
                                borderRadius: BorderRadius.circular(1000)),
                            child: Image.asset("assets/red_logo.png"),
                          ),
                          SizedBox(height: 50),
                          GradientText(
                            "Jhumo",
                            style: Get.textTheme.displayLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                            colors: _themeController.isDark
                                ? Themer.gradientDark.colors
                                : Themer.gradientLight.colors,
                          ),
                          // GradientText(
                          //   "By Yagnesh Jariwala",
                          //   style: Get.textTheme.bodyMedium,
                          //   colors: _themeController.isDark
                          //       ? Themer.gradientLight.colors
                          //       : Themer.gradientDark.colors,
                          // ),
                          Text(
                            "v1.0.0",
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  LabelText(
                    text: "Our Vision",
                    line: true,
                  ),
                  // Text(
                  //   "Our Vision",
                  //   style: Get.textTheme.titleLarge,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "At Jhumo, we think that music unites individuals from all backgrounds and cultures. Our goal is to strengthen this bond between friends by enabling them to share and appreciate music together in unison, wherever they may be.",
                      textAlign: TextAlign.start,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 32),
                  // Text(
                  //   "Meet the Developers",
                  //   style: Get.textTheme.titleLarge,
                  // ),
                  LabelText(
                    text: "Meet the Developer",
                    line: true,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Hello there, I'm Yagnesh, a tech-obsessed music and Flutter developer. My mission with Jhumo is to use music's ability to unite people. On GitHub and LinkedIn, you may learn more about my work and establish a connection with me.",
                      textAlign: TextAlign.start,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _launchURL('https://github.com/yagnesh0312');
                    },
                    leading: Icon(Icons.link),
                    title: Text("Github"),
                    subtitle: Text("github.com/yagnesh0312"),
                  ),
                  ListTile(
                    onTap: () {
                      _launchURL(
                          'https://www.linkedin.com/in/yagnesh-jariwala-70273128b/');
                    },
                    leading: Icon(Icons.link),
                    title: Text("Linkedin"),
                    subtitle: Text("Yagnesh Jariwala"),
                  ),
                  ListTile(
                    onTap: () {
                      _launchURL('https://yagnesh0312.github.io');
                    },
                    leading: Icon(Icons.link),
                    title: Text("Website"),
                    subtitle: Text("yagnesh0312.github.io"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    await launchUrlString(url);
    // if (await canLaunch(url)) {
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
