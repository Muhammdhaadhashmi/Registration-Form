
import 'package:flutter/material.dart';

import '../model/User.dart';
import '../services/userService.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _useremailController = TextEditingController();
  var _userdepartmentController = TextEditingController();
  var _userrollnumberController = TextEditingController();
  var _userinterestController = TextEditingController();
  var _userDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;

  bool _validateemail = false;
  bool _validatedepartment = false;
  bool _validaterollnumber = false;
  bool _validateinterest = false;

  bool _validateDescription = false;
  var _userService=UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Devicon Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Student',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText:
                        _validateName ? 'Name is required' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userContactController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Contact',
                    labelText: 'Contact',
                    errorText: _validateContact
                        ? 'Contact is required'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _useremailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    // errorText:
                    // _validateemail ? 'Email is required' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userdepartmentController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Department',
                    labelText: 'Department',
                    // errorText:
                    // _validatedepartment ? 'Department is required' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userrollnumberController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter   Roll Number',
                    labelText: 'Roll Number',
                    // errorText:
                    // _validaterollnumber ? 'Roll Number is Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userinterestController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter  Interest',
                    labelText: 'Interest',
                    // errorText:
                    // _validateinterest ? 'Interest is required' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userDescriptionController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Description',
                    labelText: 'Description',
                    // errorText: _validateDescription
                    //     ? 'Description is required'
                    //     : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _useremailController.text.isEmpty
                              ? _validateemail = true
                              : _validateemail = false;
                          _userdepartmentController.text.isEmpty
                              ? _validatedepartment = true
                              : _validatedepartment = false;
                          _userrollnumberController.text.isEmpty
                              ? _validaterollnumber = true
                              : _validaterollnumber = false;
                          _userinterestController.text.isEmpty
                              ? _validateinterest = true
                              : _validateinterest = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;

                        });
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateemail == false &&
                            _validatedepartment == false &&
                            _validaterollnumber == false &&
                            _validateinterest == false &&
                            _validateDescription == false) {
                         // print("Good Data Can Save");
                          var _user = User();
                          _user.name = _userNameController.text;
                          _user.contact = _userContactController.text;
                          _user.email = _useremailController.text;
                          _user.department = _userdepartmentController.text;
                          _user.rollnumber = _userrollnumberController.text;
                          _user.interest = _userinterestController.text;
                          _user.description = _userDescriptionController.text;
                          var result=await _userService.SaveUser(_user);
                         Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _useremailController.text = '';
                        _userdepartmentController.text = '';
                        _userrollnumberController.text = '';
                        _userinterestController.text = '';
                        _userDescriptionController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
