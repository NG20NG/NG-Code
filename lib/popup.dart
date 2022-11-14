import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class PopUp extends StatefulWidget {
  const PopUp(BuildContext context, {super.key, required this.index});
  final index;
  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController delete = TextEditingController();
    var box = Hive.box("cards");
    void deleteBox() {
      box.deleteAt(widget.index);
    }

    return AlertDialog(
        title: Text(
          "Delete < ${box.getAt(widget.index)[0]} >",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Type the title to delete",
              style: TextStyle(color: Color.fromARGB(255, 182, 182, 182)),
            ),
            TextField(
              maxLength: 20,
              cursorColor: Colors.amber,
              controller: delete,
              maxLines: 1,
              style: const TextStyle(
                color: Color.fromARGB(255, 190, 190, 190),
              ),
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                prefixIcon: Icon(Icons.title),
                hintText: "Enter a title",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (delete.text == "${box.getAt(widget.index)[0]}") {
                          debugPrint(delete.text);
                          // box.delete(delete.text);
                          // Navigator.pop(context);
                        } else {}
                      });
                    },
                    child: const Text("Delete")),
              ),
            )
          ],
        ));
  }
}
