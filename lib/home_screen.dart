import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = 'guest';
  Box demoBox = Hive.box('demo');

  @override
  void dispose() {
    demoBox.close();
    super.dispose();
  }

  addData() async {
    await demoBox.put('name', 'hello');
    readData();
  }

  readData() async {
    name = await demoBox.get('name') ?? 'guest';
    setState(() {});
  }

  updateData() async {
    await demoBox.put('name', 'ragu');
    readData();
  }

  deleteData() async {
    await demoBox.delete('name');
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive DB'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: addData, child: Text('Create')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: readData, child: Text('Read')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: updateData, child: Text('Update')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: deleteData, child: Text('Delete')),
            ],
          ),
        ),
      ),
    );
  }
}
