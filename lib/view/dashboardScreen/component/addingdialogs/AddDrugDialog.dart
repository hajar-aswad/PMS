import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

class AddDrugDialog extends  GetView<DashboardScreenController>  {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add  new manufactor '),
      content: TextField(
        controller: controller.newindication,
        decoration: InputDecoration(labelText: ' manufactor company name'),
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
               
                    await controller.createManufactureCompany();
                              Navigator.pop(context); 

                },
        
          child: Text('OK'),
        ),
      ],
    );
  }
}