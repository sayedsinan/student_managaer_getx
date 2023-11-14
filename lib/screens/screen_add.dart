import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:student_getx/controller/db_fucntion_controller.dart';
import 'package:student_getx/controller/screen_home_controler.dart';
import 'package:student_getx/model/data_model.dart';

class ScreenAdding extends StatelessWidget {
  final Studentmodel? data;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _stdFromController = TextEditingController();
  final _parentFromController = TextEditingController();
  final _placeFromController = TextEditingController();
  final DbFunctionsController _controller = Get.put(DbFunctionsController());
  // ignore: non_constant_identifier_names
  final HomeController Homecontroller = Get.put(HomeController());
  ScreenAdding({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Students'),
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameFromController,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _ageFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Age'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _adNoFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Admission Number'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _stdFromController,
                  decoration: const InputDecoration(
                    label: Text('Class'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _parentFromController,
                  decoration: const InputDecoration(
                    label: Text('Parent Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _placeFromController,
                  decoration: const InputDecoration(
                    label: Text('Place'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<DbFunctionsController>(builder: (controller) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 15),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                        ),
                      ),
                      child: _controller.img.trim().isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(const Base64Decoder()
                                  .convert(_controller.img)),
                            )
                          : Container(),
                    );
                  }),
                  IconButton(
                    onPressed: () async {
                      _controller.pickimage();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Homecontroller.submission(
                      context: context,
                      name: _nameFromController.text,
                      age: _ageFromController.text,
                      admn: _adNoFromController.text,
                      std: _stdFromController.text,
                      parent: _placeFromController.text,
                      place: _placeFromController.text);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Student'),
              )
            ],
          ),
        ),
      ),
    );
  }
}