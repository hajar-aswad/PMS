import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/core/constants/app_enums.dart';
import 'package:pms/view/dashboardScreen/component/homecompocent/details_card.dart';
import 'package:pms/view/dashboardScreen/component/homecompocent/homecenter.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/Accepted.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/AllDrugRequestRight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/AllRequests.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/Archave.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/CategoriesRight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/DosageFormRaight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/ManufactorRaight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/Pending.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/Rejected.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/ScientificMaterialsRaight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/SupplierRight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/TherapeuticEffectsRaight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/indicationsRaight.dart';
import 'package:pms/view/dashboardScreen/component/raightsidedetails/pharmacy.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllAddingAdrugRequests.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllArchived.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllArchivedDrug.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllPending.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllPendingDrug.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllRegisterRequestTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/DosageFormTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/IndicationsTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/ManufactureCompaniesTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/ScientificMaterialsTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/TherapeuticEffectsTable.dart';
import 'package:pms/view/dashboardScreen/component/tabels/classifications_table.dart';
import 'package:pms/view/dashboardScreen/component/tabels/PharmacyTable.dart';

import 'package:pms/view/dashboardScreen/component/tabels/drugstable.dart';

class MainController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String selectedMenuItem = 'Home';
  StatusView statusView = StatusView.none;

  Widget center = const HomeCenter();
  Widget detailsCard = details_card();

  get getAllDrugRequestsArchived => null;

  @override
  void onInit() {
    super.onInit();
  }

  void changeSelectedMenuItem(String item) {
    selectedMenuItem = item;
    switch (selectedMenuItem) {

      case 'Home':
        center = const HomeCenter();
        detailsCard = details_card();
        break;
      case '  Suppliers':
        center =  PharmacyTable();
        detailsCard = SupplierRight();
        break;
      case 'All Drugs':
        center = const DrugTable();
        detailsCard =  PharmacyRight();
        break;

      case 'Pharmacists':
        center =  PharmacyTable();
        detailsCard = PharmacyRight();
        break;
      case 'Categories':
        center = const ClassificationsTable();
        detailsCard = const CategoriesRight();
        break;
      case 'Manufacture Companies':
        center =const ManufactureCompaniesTable();
        detailsCard = const ManufactorRight();
        break;
      case 'Dosage Forms':
        center = const DosageFormTable();
        detailsCard = const DosageFormRight();
        break;
      case 'Scientific Materials':
        center =const ScientificMaterialsTable();
            
        detailsCard = const ScientificMaterialsRight();
        break;
      case 'Indications':
        center = const IndicationsTable();
        detailsCard = const IndicationsRight();
        break;
   
      case 'Therapeutic Effects':
        center = const TherapeuticEffectsTable();
        detailsCard = const TherapeuticEffectsRaight();
 
        break;
     
      case 'All Register Requests':
        center = const AllRegisterRequestTable();
        detailsCard = AllRequests();
        break;
      case 'Pending':
        center = const AllPendingRegisterRequestTable();
        detailsCard = Pending();
        break;
      case 'Accepted':
        center = const AllRegisterRequestTable();
        detailsCard = Accepted();
        break;
      case 'Rejected':
        center =  const AllRegisterRequestTable();
        detailsCard = Rejected();
        break;
      case 'Archived':
        center =  const AllArchivedgRegisterRequestTable();
        detailsCard = Archived();
        break;
      case 'All Adding A drug Requests':
        center = AllAddDrugRequestTable();
        detailsCard = AllDrugRequest();
        break;
      case ' Pending':
        center = AllPendingAddDrugRequestTable();
        detailsCard = Pending();
        break;
      case ' Accepted':
        center = AllAddDrugRequestTable();
        detailsCard = Accepted();
        
        break;  case ' Archived':
        center = AllArchivedAddDrugRequestTable();
        detailsCard = Archived();
        
        break;
      case ' Rejected':
        center = AllAddDrugRequestTable();
        detailsCard = Rejected();
        break;
        
      default:
        center = Container(color: Colors.red, height: 500);
        detailsCard = Container(color: Colors.blue, height: 500);
    }
    update();
  }
}
