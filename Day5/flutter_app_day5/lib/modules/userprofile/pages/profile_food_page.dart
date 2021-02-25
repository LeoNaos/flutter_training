import 'package:flutter/material.dart';

class ProfileFoodPage extends StatefulWidget {
  @override
  _ProfileFoodPageState createState() => _ProfileFoodPageState();
}

class _ProfileFoodPageState extends State<ProfileFoodPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final myFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Address'),
      ),
      body: Form(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 14,
                    child: Icon(
                      Icons.camera_alt,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 16,
                ),
                Text(
                  'User Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    focusNode: myFocusNode,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(
                            fontSize: myFocusNode.hasFocus ? 24 : 18.0,
                            //I believe the size difference here is 6.0 to account padding
                            color: myFocusNode.hasFocus
                                ? Colors.blue
                                : Colors.grey),
                        labelText: 'Hint text',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ))),
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
