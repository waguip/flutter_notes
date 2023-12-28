import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_target_sistemas/domain/stores/information_capture_store.dart';
import 'package:prova_target_sistemas/widgets/bottom_label.dart';
import 'package:prova_target_sistemas/widgets/scaffold_background.dart';

class InformationCaptureScreen extends StatefulWidget {
  const InformationCaptureScreen({Key? key}) : super(key: key);

  @override
  State<InformationCaptureScreen> createState() =>
      _InformationCaptureScreenState();
}

class _InformationCaptureScreenState extends State<InformationCaptureScreen> {
  late FocusNode _focusNode;

  InformationCaptureStore infoStore = InformationCaptureStore();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          //FutureBuilder para aguardar os dados do shared preference antes de montar a tela
          child: FutureBuilder<String>(
            future: infoStore.getInfoList(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return _mainScreen();
              } else {
                return const CircularProgressIndicator();
              }
            },
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

  Widget _mainScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _mainCard(),
        ),
        const SizedBox(height: 50),
        _textField(),
        const SizedBox(height: 120),
        const Align(
          alignment: Alignment.bottomCenter,
          child: BottomLabel(),
        )
      ],
    );
  }

  Widget _mainCard() {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.elliptical(10, 55)),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: infoStore.infoList.length,
          itemBuilder: (context, index) => _listItem(index),
        );
      }),
    );
  }

  Widget _listItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              infoStore.infoList[index],
              textAlign: TextAlign.center,
            ),
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            trailing: _icons(index),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _icons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.border_color),
          color: Colors.black,
          iconSize: 35,
          padding: const EdgeInsets.all(1),
          tooltip: "Editar",
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.cancel),
          color: Colors.red[600],
          iconSize: 35,
          padding: const EdgeInsets.all(1),
          tooltip: "Deletar",
          onPressed: () => _deleteInfo(context, index),
        ),
      ],
    );
  }

  Widget _textField() {
    return TextField(
      focusNode: _focusNode,
      textInputAction: TextInputAction.none,
      autofocus: true,
      onSubmitted: (text) => _validateField(text),
      onTapOutside: (_) => _focusNode.requestFocus(),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Digite seu texto',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  void _validateField(String text) {
    if (text.isNotEmpty) {
      infoStore.addInfo(text);
    }
  }

  void _deleteInfo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Deletar informação'),
          content: const Text(
              'Tem certeza que deseja deletar a informação selecionada?'),
          actions: [
            TextButton(
              onPressed: () {
                infoStore.removeInfo(index);
                Navigator.of(context).pop();
              },
              child: const Text('Sim', textAlign: TextAlign.end),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não', textAlign: TextAlign.end),
            ),
          ],
        );
      },
    );
  }
}
