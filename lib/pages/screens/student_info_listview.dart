import 'package:flutter/material.dart';

class StudentInfoListView extends StatefulWidget {
  const StudentInfoListView({super.key});

  @override
  State<StudentInfoListView> createState() => _StudentInfoListViewState();
}

class _StudentInfoListViewState extends State<StudentInfoListView> {
  final List<Map<String, String>> students = [];

  final _idController = TextEditingController();
  final _nameController = TextEditingController();

  void _showAddStudentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Student"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Student ID'),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Student Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _idController.clear();
                _nameController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_idController.text.isNotEmpty &&
                    _nameController.text.isNotEmpty) {
                  setState(() {
                    students.add({
                      "id": _idController.text,
                      "name": _nameController.text,
                    });
                  });
                  _idController.clear();
                  _nameController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
      body: students.isEmpty
          ? const Center(
              child: Text(
                'No students added yet.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(students[index]["id"]!),
                    ),
                    title: Text(
                      students[index]["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Student ID: ${students[index]["id"]}"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${students[index]["name"]} tapped!'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStudentDialog,
        child: const Icon(Icons.add),
        tooltip: 'Add Student',
      ),
    );
  }
}
