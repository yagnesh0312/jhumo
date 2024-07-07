import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jhumo/components/button.dart';
import 'package:jhumo/components/glass_container.dart';
import 'package:jhumo/components/label.dart';
import 'package:jhumo/moduls/controller/collaboration_controller.dart';
import 'package:jhumo/moduls/model/themer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CollaborationPage extends StatelessWidget {
  CollaborationPage({super.key});
  var _collaborationController = Get.put(CollaborationController());
  var _controller = TextEditingController();
  var _durationController = TextEditingController();
  var autoSync = false.obs;
  @override
  Widget build(BuildContext context) {
    _durationController.text = _collaborationController.timeDuration.toString();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            LabelText(text: "Collaboration"),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("With this code, you may sign up and work with pals."),
                  SizedBox(height: 20),
                ],
              ),
            ),
            GetBuilder<CollaborationController>(
                init: CollaborationController(),
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GlassContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(text: "Share Code"),
                                SizedBox(height: 10),
                                GlassContainer(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children:
                                              _collaborationController.id!
                                                  .split("")
                                                  .map((e) => Expanded(
                                                        child: Text(
                                                          e,
                                                          style: Get.textTheme
                                                              .titleMedium,
                                                        ),
                                                      ))
                                                  .toList(),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text: _collaborationController
                                                    .id));
                                                    Get.snackbar("Copy", _collaborationController.id);
                                          },
                                          child: Icon(Icons.copy)),
                                    ],
                                  ),
                                )),
                                Switch(
                                    value: _collaborationController.status,
                                    onChanged: (v) {
                                      _collaborationController
                                          .setStatusOfSync(v);
                                    })
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("or"),
                        SizedBox(height: 20),
                        GlassContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(text: "Enter code"),
                                SizedBox(height: 10),
                                GlassContainer(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: TextField(  textCapitalization: TextCapitalization.sentences,

                                          controller: _controller,
                                          decoration: InputDecoration(
                                            hintText: "Enter code",
                                            border: InputBorder.none,
                                          ),
                                        ))),
                                SizedBox(height: 10),
                                GlassContainer(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: TextField(  textCapitalization: TextCapitalization.sentences,
                                          onChanged: (v) {
                                          if(v.isNotEmpty)
                                            if (double.parse(v) > 0 &&
                                                double.parse(v) < 900) {
                                              _collaborationController
                                                  .timeDurationSet(
                                                      double.parse(v).round(),
                                                      _controller.text);
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          controller: _durationController,
                                          decoration: InputDecoration(
                                            suffix: Text("ms"),
                                            hintText: "Duration",
                                            border: InputBorder.none,
                                          ),
                                        ))),
                                SfSlider(
                                  min: 0.0,
                                  max: 900.0,
                                  value: _collaborationController.timeDuration
                                      .toDouble(),
                                  interval: 20,
                                  showTicks: true,
                                  // showLabels: true,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (dynamic value) {
                                    // setState(() {
                                    //   _value = value;
                                    // });
                                    _collaborationController.timeDurationSet(
                                        value.round(), _controller.text);
                                    _durationController.text =
                                        value.round().toString();
                                  },
                                ),
                                Obx(() => ListTile(
                                      title: Text("Auto Sync"),
                                      trailing: Switch(
                                        value: autoSync.value,
                                        onChanged: (v) {
                                          if (_collaborationController
                                                  .autoSync !=
                                              null) {
                                            autoSync.value =
                                                _collaborationController
                                                    .onAutoSyncClick(v);
                                          } else {
                                            Get.snackbar(
                                                "Error", "Please Enter Code",
                                                colorText: Colors.redAccent);
                                          }
                                        },
                                      ),
                                    )),
                     
                                    TxtButton(
                                        onPressed: () {
                                          if (_controller.text.isNotEmpty) {
                                            _collaborationController
                                              .onClientSync(_controller.text);
                                          }
                                        },
                                        text: "Sync")
                                  
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
