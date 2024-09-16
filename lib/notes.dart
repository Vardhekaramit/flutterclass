
import 'package:flutter/material.dart';
import 'package:demo_widget/sqlhelper.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Map<String, dynamic>> journal = [];
  bool isLoading = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// Fetch all items from the database and refresh the UI
  void _refreshItems() async {
    final data = await SQLHelper.getItems(); // Ensure correct helper usage
    setState(() {
      journal = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  /// Show a form to add or edit an item
  void _showForm(int? id) {
    if (id != null) {
      // Edit existing item
      final existingItem = journal.firstWhere((element) => element['id'] == id);
      _titleController.text = existingItem['title'];
      _descriptionController.text = existingItem['description'];
    } else {
      // Clear form for adding a new item
      _titleController.clear();
      _descriptionController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          top: 15,
          right: 15,
          left: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 120,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await _addItem();
                } else {
                  await _updateItem(id);
                }

                // Clear the fields
                _titleController.clear();
                _descriptionController.clear();

                // Close the bottom sheet
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Create New' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  /// Add a new item to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
      _titleController.text,  // Pass title
      null,                    // Pass null for unused Password
      null,                    // Pass null for unused Email
      _titleController.text,    // Pass title to SQLHelper
      _descriptionController.text, // Pass description to SQLHelper
    );
    _refreshItems();
  }

  /// Update an existing item in the database
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id,                        // Pass the ID of the item to update
        _titleController.text,      // Pass title
        null,                       // Pass null for unused Password
        null,                       // Pass null for unused Email
        _titleController.text,      // Pass title to SQLHelper
        _descriptionController.text // Pass description to SQLHelper
    );
    _refreshItems();
  }

  /// Delete an item from the database
  Future<void> _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Successfully deleted')),
    );
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: journal.length,
        itemBuilder: (context, index) => Card(
          color: Colors.orange,
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(journal[index]['title']),
            subtitle: Text(journal[index]['description']),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _showForm(journal[index]['id']),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteItem(journal[index]['id']),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showForm(null), // Add new item
      ),
    );
  }
}
