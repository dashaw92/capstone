import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_monaco/flutter_monaco.dart';
import 'package:pantry_protocol/protocol.dart';

import '../net/connection.dart';

class EditExtractorScreen extends StatefulWidget {
  final int extractor;

  const EditExtractorScreen({super.key, required this.extractor});

  @override
  State<EditExtractorScreen> createState() => _EditExtractorScreenState();
}

class _EditExtractorScreenState extends State<EditExtractorScreen> {
  MonacoController? _controller;
  Extractor? _extractor;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  Future<void> _initController() async {
    _extractor = await Connection.conn!.getExtractor(GetExtractorRequest(id: widget.extractor));

    _controller = await MonacoController.create(
      options: const EditorOptions(
        autoClosingBrackets: AutoClosingBehavior.languageDefined,
        autoClosingQuotes: AutoClosingBehavior.languageDefined,
        cursorBlinking: CursorBlinking.solid,
        cursorStyle: CursorStyle.line,
        contextMenu: false,
        language: MonacoLanguage.lua,
        minimap: false,
        lineNumbers: true,
        quickSuggestions: false,
        parameterHints: false,
        hover: false,
        disableLayerHinting: true,
        automaticLayout: false,
        scrollBeyondLastLine: false,
        smoothScrolling: false,
        theme: MonacoTheme.vsDark,
        fontSize: 14,
        readOnly: false,
      ),
    );


    await _controller!.setInteractionEnabled(true);
    await _controller!.setValue(_extractor!.script);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    _saveScript();
  }

  Future<void> _saveScript() async {
    final script = jsonDecode(await _controller?.getValue() ?? "") as String;
    await Connection.conn!.updateExtractor(UpdateExtractorRequest(id: widget.extractor, script: script));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_extractor?.label ?? "Script ${widget.extractor}")),
      body: _controller?.webViewWidget ?? Center(child: CircularProgressIndicator()),
    );
  }
}