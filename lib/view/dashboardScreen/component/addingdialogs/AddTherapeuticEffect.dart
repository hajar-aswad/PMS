import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

class AddTherapeuticEffect extends  GetView<DashboardScreenController>{

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add  new Therapeutic Effect'),
      content: TextField(
        controller: controller.newtherpic,
        decoration: const InputDecoration(labelText: 'Enter Therapeutic Effect name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
                   
  onPressed: () async {
               
                    await controller.createScientificMaterial();
                              Navigator.pop(context); 

                },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
