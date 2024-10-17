//"assets/icons/drugs-medicine-pills-svgrepo-com.svg",
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/data/models/drug.dart';
import 'package:pms/view/widget/handle_request.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class AllDrugs extends GetView<DashboardScreenController> {
  const AllDrugs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(
        builder: (controller) => HandleRequest(
            statusView: controller.statusView,
            child: Container(
              padding: const EdgeInsets.all(AppDimentions.defaultPadding),
              decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Add new  drug  manually ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimentions.defaultPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                          child: SvgPicture.asset(
                        'assets/icons/drugs-medicine-pills-svgrepo-com.svg',
                        color: Colors.white54,
                        height: 150,
                      )),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: controller.brandNameController,
                              decoration: const InputDecoration(
                                  labelText: 'Brand Name'),
                            ),
                            TextField(
                              controller: controller.scientificNameController,
                              decoration: const InputDecoration(
                                  labelText: 'Scientific Name'),
                            ),
                            TextField(
                              controller: controller.capacityController,
                              decoration:
                                  const InputDecoration(labelText: 'Capacity'),
                            ),
                            TextField(
                              controller: controller.titerController,
                              decoration:
                                  const InputDecoration(labelText: 'Titer'),
                            ),
                            DropdownButtonFormField<Category>(
                              value: controller.cat,
                              // Use the selected category from the controller
                              onChanged: (value) {
                                controller.cat = value!;
                              },
                              items: controller.categor.map((cat) {
                                return DropdownMenuItem<Category>(
                                  value: cat,
                                  child: Text(cat.name!),
                                );
                              }).toList(),
                              decoration:
                                  const InputDecoration(labelText: 'Category'),
                            ),
                            DropdownButtonFormField<Category>(
                              value: controller.mani,
                              // Use the selected category from the controller
                              onChanged: (value) {
                                controller.mani = value!;
                              },
                              items: controller.manifactor.map((cat) {
                                return DropdownMenuItem<Category>(
                                  value: cat,
                                  child: Text(cat.name!),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                  labelText: 'ManiFactor'),
                            ),
                            DropdownButtonFormField<Category>(
                              value: controller.dos,
                              // Use the selected category from the controller
                              onChanged: (value) {
                                controller.dos = value!;
                              },
                              items: controller.dosag.map((cat) {
                                return DropdownMenuItem<Category>(
                                  value: cat,
                                  child: Text(cat.name!),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                  labelText: 'DosageForm'),
                            ),
                            DataTable(
                              columns: const [
                                DataColumn(label: Text('Scientific Materials'))
                              ],
                              rows: controller.seintific
                                  .map((e) => DataRow(cells: [
                                        DataCell(
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: controller
                                                        .selectedScientificMaterials[
                                                    e.id!],
                                                onChanged: (value) {
                                                  controller
                                                          .selectedScientificMaterials[
                                                      e.id!] = value!;
                                                },
                                                activeColor: Colors.blue,
                                              ),
                                              Text(e.name!),
                                            ],
                                          ),
                                        ),
                                      ]))
                                  .toList(),
                            ),
                            DataTable(
                              columns: const [
                                DataColumn(label: Text('Indications'))
                              ],
                              rows:controller.indi
                                  .map((e) => DataRow(cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller
                                            .selectedIndications[
                                        e.id!],
                                        onChanged: (value) {
                                          controller
                                              .selectedIndications[
                                          e.id!] = value!;
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Text(e.name!),
                                    ],
                                  ),
                                ),
                              ]))
                                  .toList(),
                            ),
                            DataTable(
                              columns: const [
                                DataColumn(label: Text('therapeutic Effects'))
                              ],
                              rows: controller.therapeutic
                                  .map((e) => DataRow(cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller
                                            .selectedTherapeuticEffects[
                                        e.id!],
                                        onChanged: (value) {
                                          controller
                                              .selectedTherapeuticEffects[
                                          e.id!] = value!;
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Text(e.name!),
                                    ],
                                  ),
                                ),
                              ]))
                                  .toList(),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 120,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Add'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
