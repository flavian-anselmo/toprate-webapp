import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:topratepppp/screens/addcontent/add_module_one.dart';
import 'package:topratepppp/screens/modules/Assignments/upload.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SpeedDial(
        child: const Icon(Icons.add),
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.view_module),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Upload Module Materials',
            onPressed: () {
              Navigator.pushNamed(context, AddModuleOne.id);
            },
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: const Icon(Icons.book),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'Upload Assignments',
            onPressed: () {
              Navigator.pushNamed(context, AssignmentUpload.id);
            },
          ),
          //  Your other SpeeDialChildren go here.
        ],
      ),
    );
  }
}
