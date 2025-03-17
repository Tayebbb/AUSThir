import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the current user's UID
  late String uid;

  @override
  void initState() {
    super.initState();
    // Fetch the current user's UID
    User? user = _auth.currentUser;
    if (user != null) {
      uid = user.uid;
    } else {
      // If the user is not logged in, redirect to the login page
      // You can add the login page here
    }
  }

  // Reference to the user's To-Do list in Firestore
  late CollectionReference _tasksCollection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tasksCollection = FirebaseFirestore.instance
        .collection('austhir')
        .doc(uid)  // Use UID to store the to-do list under the user's document
        .collection('tasks');  // Create a "tasks" sub-collection for each user
  }

  void _addTask() async {
    if (_taskNameController.text.isNotEmpty) {
      await _tasksCollection.add({
        'name': _taskNameController.text,
        'date': _taskDateController.text.isEmpty ? null : _taskDateController.text,
        'completed': false,
      });
      _taskNameController.clear();
      _taskDateController.clear();
    }
  }

  void _deleteTask(String id) async {
    await _tasksCollection.doc(id).delete();
  }

  void _toggleTaskCompletion(String id, bool currentStatus) async {
    await _tasksCollection.doc(id).update({'completed': !currentStatus});
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "To-Do List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.indigo[900],
              child: const Column(
                children: [
                  SizedBox(height: 70),
                  Center(
                    child: Text("To-Do List", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _taskNameController,
                      decoration: InputDecoration(labelText: 'Task Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _taskDateController,
                      decoration: InputDecoration(labelText: 'Task Date (optional)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _addTask,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue.shade800, borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Center(
                          child: Text('Add Task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: StreamBuilder(
                        stream: _tasksCollection.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return const Center(child: Text("Error fetching data"));
                          }
                          return ListView(
                            children: snapshot.data!.docs.map((task) {
                              Map<String, dynamic> taskData = task.data() as Map<String, dynamic>;
                              return Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                color: Colors.blue.shade800,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      '${snapshot.data!.docs.indexOf(task) + 1}',
                                      style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  title: Text(
                                    taskData['name'] ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      decoration: taskData['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
                                    ),
                                  ),
                                  subtitle: taskData['date'] != null
                                      ? Text(taskData['date']!, style: const TextStyle(color: Colors.white70))
                                      : null,
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: taskData['completed'],
                                        onChanged: (value) {
                                          _toggleTaskCompletion(task.id, taskData['completed']);
                                        },
                                        checkColor: Colors.blue.shade800,
                                        activeColor: Colors.white,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.white),
                                        onPressed: () => _deleteTask(task.id),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
