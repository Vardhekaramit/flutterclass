import 'package:demo_widget/sqlhelper.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Map<String, dynamic>> journal = [];

  bool isLoading = true;

  TextEditingController _titlecon = TextEditingController();
  TextEditingController _description = TextEditingController();

  void _refresh()async{
    final data = await Sqlhelper.getItems();
    setState(() {
      journal = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
        ),
       /*showModalBottomSheet(
          context: context,
          builder: (context) => Container(

          );
      ),
      body:
*/

    );
  }
}
