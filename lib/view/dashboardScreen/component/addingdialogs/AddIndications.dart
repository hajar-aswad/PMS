import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

class AddIndicattions extends  GetView<DashboardScreenController>  {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add  new Indicattions'),
      content: TextField(
        controller: controller.newindication,
        decoration: InputDecoration(labelText: 'Indicattions name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          
  onPressed: () async {
               
                    await controller.createAllIndication();
                              Navigator.pop(context); 

                },
        
          child: Text('OK'),
        ),
      ],
    );
  }
}