import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final _controller = quill.QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quill Text Editor"),
      ),
      body: Column(
        children: [
          quill.QuillToolbar.basic(
            controller: _controller,
            toolbarIconSize: 30,
            iconTheme: const quill.QuillIconTheme(
                borderRadius: 16,
                iconUnselectedFillColor: Colors.black26,
                iconSelectedFillColor: Colors.deepPurple),
            customButtons: [
              quill.QuillCustomButton(
                icon: Icons.add,
                onTap: () {},
              ),
              quill.QuillCustomButton(
                icon: Icons.delete,
                onTap: () {},
              )
            ],
            multiRowsDisplay: false,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(16),
              child: quill.QuillEditor.basic(
                  controller: _controller, readOnly: false),
            ),
          )
        ],
      ),
    );
  }
}
