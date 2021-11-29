import 'package:flutter/material.dart';
import 'frame_classes.dart';
import 'frame_display.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Frame Calculator',
      theme: ThemeData.dark(),
      home: const HomePage(title: 'Picture Frame Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Frame frame = Frame();

  final _projectName = TextEditingController();
  final _imageWidth = TextEditingController();
  final _imageHeight = TextEditingController();
  final _frameWidth = TextEditingController();
  final _frameThickness = TextEditingController();
  final _frameOverlap = TextEditingController();
  final _matTop = TextEditingController();
  final _matSides = TextEditingController();
  final _matOverlap = TextEditingController();

  @override
  void dispose() {
    _projectName.dispose();
    _imageWidth.dispose();
    _imageHeight.dispose();
    _frameWidth.dispose();
    _frameThickness.dispose();
    _frameOverlap.dispose();
    _matTop.dispose();
    _matSides.dispose();
    _matOverlap.dispose();
    super.dispose();
  }

  void reset() {
    _projectName.clear();
    _imageWidth.clear();
    _imageHeight.clear();
    _frameWidth.clear();
    _frameThickness.clear();
    _frameOverlap.clear();
    _matTop.clear();
    _matSides.clear();
    _matOverlap.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: _projectName,
                decoration: const InputDecoration(
                  hintText: 'Name of Project:',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.projectName = value;
                      })
                    }),
              ),
              TextField(
                controller: _imageWidth,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Image width in inches:',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.imageWidth =
                            value != "" ? double.parse(value) : 0.0;
                      })
                    }),
              ),
              TextField(
                controller: _imageHeight,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Image height in inches:',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.imageHeight =
                            value != "" ? double.parse(value) : 0.0;
                      })
                    }),
              ),
              TextField(
                controller: _frameWidth,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Frame width in inches:',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.frameWidth =
                            value != "" ? double.parse(value) : 0.0;
                      })
                    }),
              ),
              TextField(
                controller: _frameThickness,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Frame thickness in inches (0.75 default):',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.frameThickness =
                            value != "" ? double.parse(value) : 0.0;
                      })
                    }),
              ),
              TextField(
                controller: _frameOverlap,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'(^\-?\d*\.?\d{0,3})$')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Frame overlap of image in inches (0.25 default):',
                ),
                onChanged: ((String value) => {
                      setState(() {
                        frame.frameOverlap = value != "" && value != "-"
                            ? double.parse(value)
                            : 0.0;
                      })
                    }),
              ),
              CheckboxListTile(
                  title: const Text("Needs a mat?"),
                  value: frame.hasMat,
                  onChanged: (bool? value) {
                    value == true ? frame.mat = Mat() : frame.mat = null;
                    setState(() {
                      frame.hasMat = value!;
                    });
                  }),
              if (frame.hasMat) ...[
                TextField(
                  controller: _matTop,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,3}')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Mat top/bottom thickness in inches:',
                  ),
                  onChanged: ((String value) => {
                        setState(() {
                          frame.mat!.matTop =
                              value != "" ? double.parse(value) : 0.0;
                        })
                      }),
                ),
                TextField(
                  controller: _matSides,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,3}')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Mat side thickness in inches:',
                  ),
                  onChanged: ((String value) => {
                        setState(() {
                          frame.mat!.matSides =
                              value != "" ? double.parse(value) : 0.0;
                        })
                      }),
                ),
                TextField(
                  controller: _matOverlap,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,3}')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Mat overlap of image in inches (0.25 default):',
                  ),
                  onChanged: ((String value) => {
                        setState(() {
                          frame.mat!.matOverlap =
                              value != "" ? double.parse(value) : 0.0;
                        })
                      }),
                ),
              ],
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                    return Theme.of(context).colorScheme.secondary;
                  }), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Theme.of(context).colorScheme.background;
                  })),
                  onPressed: (() => {
                        frame.calculateDimensions(),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FrameDisplay(frame: frame)))
                      }),
                  child: const Text('Calculate'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                    return Theme.of(context).colorScheme.secondary;
                  }), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Theme.of(context).colorScheme.background;
                  })),
                  onPressed: (() => {
                        setState(() {
                          frame = Frame();
                        }),
                        reset()
                      }),
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
