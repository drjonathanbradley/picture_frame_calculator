import 'package:flutter/material.dart';
import 'frame_classes.dart';

class FrameDisplay extends StatelessWidget {
  final Frame frame;

  const FrameDisplay({Key? key, required this.frame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(frame.projectName),
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ListTile(
                  title: Text(
                      'Frame Width: ${frame.frameWidth.toStringAsFixed(3)}'))),
          Card(
              child: ListTile(
                  title: Text(
                      'Frame Thickness: ${frame.frameThickness.toStringAsFixed(3)}'))),
          Card(
              child: ListTile(
                  title: Text(
                      'Frame Top/Bottom Length: ${frame.frameTopLength.toStringAsFixed(3)}'))),
          Card(
              child: ListTile(
                  title: Text(
                      'Frame Sides Length: ${frame.frameSidesLength.toStringAsFixed(3)}'))),
          Card(
              child: ListTile(
                  title: Text(
                      'Inside Miter Top/Bottom Length: ${frame.miterTopLength.toStringAsFixed(3)}'))),
          Card(
              child: ListTile(
                  title: Text(
                      'Inside Miter Sides Length: ${frame.miterSidesLength.toStringAsFixed(3)}'))),
          if (frame.hasMat) ...[
            Card(
                child: ListTile(
                    title: Text(
                        'Mat Height: ${frame.mat!.matWidth.toStringAsFixed(3)}'))),
            Card(
                child: ListTile(
                    title: Text(
                        'Mat Width: ${frame.mat!.matHeight.toStringAsFixed(3)}'))),
            Card(
                child: ListTile(
                    title: Text(
                        'Mat Opening Height: ${frame.mat!.matCutWidth.toStringAsFixed(3)}'))),
            Card(
                child: ListTile(
                    title: Text(
                        'Mat Opening Width: ${frame.mat!.matCutHeight.toStringAsFixed(3)}'))),
          ],
        ]));
  }
}
