import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PinInputType { none, password, custom }

class SquareShapedPinUI extends StatefulWidget {
  final double boxSize;
  final int codeLength;
  final PinInputType? inputType;
  final String pinInputCustom;
  final ValueChanged<String>? onSubmit;
  final bool emptyPinText;

  SquareShapedPinUI({
    Key? key,
    this.boxSize = 40,
    this.codeLength = 6,
    this.inputType,
    this.pinInputCustom = "*",
    this.onSubmit,
    this.emptyPinText = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldPinStateSec();
}

class _TextFieldPinStateSec extends State<SquareShapedPinUI> {
  late FocusNode _focusNode;
  late List<String> pinsInputed;
  bool ending = false;

  late TextEditingController _textEditingController;

  String _smsCode = "";
  final intRegex = RegExp(r'\d+', multiLine: true);

  late List<TextEditingController> textController;
  late List<FocusNode> focusNodeOld;
  HashMap<int, String> mapResult = HashMap();

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    pinsInputed = [];
    for (var i = 0; i < widget.codeLength; i++) {
      pinsInputed.add("");
    }
    if (Platform.isAndroid) {
      // _getSignatureCode();
      // _startListeningSms();
    }
  }

  // // get signature code
  // _getSignatureCode() async {
  //   String? signature = await SmsVerification.getAppSignature();
  //   print("signature $signature");
  // }

  /// listen sms
  // _startListeningSms() {
  //   SmsVerification.startListeningSms().then((message) {
  //     setState(() {
  //       _smsCode = SmsVerification.getCode(message, intRegex);
  //       _textEditingController.text = _smsCode;
  //       widget.onSubmit(_smsCode);
  //     });
  //   });
  // }

  List<Widget> _buildBody(BuildContext context) {
    var tmp = <Widget>[];
    for (var i = 0; i < this.widget.codeLength; i++) {
      tmp.add(_buildFieldInput(context, i));
      tmp.add(const SizedBox(width: 8));
    }
    return tmp;
  }

  Widget _buildFieldInput(BuildContext context, int i) => InkWell(
        onTap: () {
          _focusNode.requestFocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffEAEAEA),
            // border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          padding: const EdgeInsets.all(2),
          height: 90,
          width: widget.boxSize,
          alignment: Alignment.center,
          child: Text(
            _getPinDisplay(i),
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );

  String _getPinDisplay(int position) {
    var display = "";
    var value = pinsInputed[position];
    switch (widget.inputType) {
      case PinInputType.password:
        display = "*";
        break;
      case PinInputType.custom:
        display = widget.pinInputCustom;
        break;
      default:
        display = value;
        break;
    }
    return value.isNotEmpty ? display : value;
  }

  void _bindTextIntoWidget(String text) {
    ///Reset value
    for (var i = text.length; i < pinsInputed.length; i++) {
      pinsInputed[i] = "";
    }
    if (text.isNotEmpty) {
      for (var i = 0; i < text.length; i++) {
        pinsInputed[i] = text[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: widget.boxSize,
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildBody(context),
                ),
              ],
            ),
            Opacity(
              child: TextField(
                showCursor: true,
                maxLength: widget.codeLength,
                autofocus: true,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: _textEditingController,
                onSubmitted: (text) {
                  print(text);
                },
                onChanged: (text) {
                  _bindTextIntoWidget(text);
                  setState(() {});
                  ending = text.length == widget.codeLength;
                  if (ending) {
                    widget.onSubmit!(text);
                  }
                },
              ),
              opacity: 0.0,
            )
          ]),
        ),
      );

  // to clear text If the parent widget rebuilds i.e as setState is called in parent didUpdateWidget is called in child
  @override
  void didUpdateWidget(SquareShapedPinUI oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.emptyPinText) {
      if (this._textEditingController != null) {
        this._textEditingController.clear();
      }
      _bindTextIntoWidget("");
    }
  }
}
