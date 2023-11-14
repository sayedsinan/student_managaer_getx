import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controller/db_fucntion_controller.dart';
import 'package:student_getx/controller/student_conoller.dart';
import 'package:student_getx/model/data_model.dart';

// ignore: must_be_immutable
class ScreenEditing extends StatelessWidget {
  final Studentmodel? data;
  bool? editorClicked = false;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _stdFromController = TextEditingController();
  final _parentFromController = TextEditingController();
  final _placeFromController = TextEditingController();
  final DbFunctionsController _controller = Get.put(DbFunctionsController());
  final EditingCotroller _editingCotroller = Get.put(EditingCotroller());
  ScreenEditing({Key? key, this.data, this.editorClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _nameFromController.text = data!.name;
    _ageFromController.text = data!.age;
    _adNoFromController.text = data!.admissionNumber;
    _stdFromController.text = data!.std;
    _parentFromController.text = data!.parentName;
    _placeFromController.text = data!.place;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:Colors.grey[300] ,
        title: const Text('Edit Student Details'),
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
                    label: Text('age'),
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
                    label: Text('Admission No'),
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
                    if (editorClicked == true) {
                      _controller.img = data!.img;
                      editorClicked = false;
                    }
                    return CircleAvatar(
                      radius: 40,
                      backgroundImage: MemoryImage(
                          const Base64Decoder().convert(_controller.img)),
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
                  _editingCotroller.submission(
                      context: context,
                      name: _nameFromController.text,
                      age: _ageFromController.text,
                      admn: _adNoFromController.text,
                      std: _stdFromController.text,
                      parent: _placeFromController.text,
                      place: _placeFromController.text,
                      id: data!.id);
                },
                icon: const Icon(Icons.update),
                label: const Text('Update Profile'),
                
              )
            ],
          ),
        ),
      ),
    );
  }

  void clear() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _nameFromController.clear();
    _ageFromController.clear();
    _adNoFromController.clear();
    _stdFromController.clear();
    _parentFromController.clear();
    _placeFromController.clear();
  }
}