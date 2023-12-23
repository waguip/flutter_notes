import 'package:flutter/material.dart';
import 'package:prova_target_sistemas/widgets/bottom_label.dart';
import 'package:prova_target_sistemas/widgets/scaffold_background.dart';

class InformationCaptureScreen extends StatefulWidget {
  const InformationCaptureScreen({Key? key}) : super(key: key);

  @override
  State<InformationCaptureScreen> createState() =>
      _InformationCaptureScreenState();
}

class _InformationCaptureScreenState extends State<InformationCaptureScreen> {
  final _focusNode = FocusNode();
  List<String> savedTexts = [];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 55)),
                  ),
                  child: ListView.builder(
                    itemCount: savedTexts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          shape: const Border(
                            bottom: BorderSide(),
                          ),
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text(
                            savedTexts[index],
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Colors.black,
                                onPressed: () {
                                  // Edição do texto
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  setState(() {
                                    savedTexts.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextField(
                focusNode: _focusNode,
                textInputAction: TextInputAction.none,
                autofocus: true,
                onSubmitted: (text) {
                  setState(() {
                    savedTexts.add(text);
                  });
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Digite seu texto',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(height: 120),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomLabel(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
