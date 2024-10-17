import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/api/dashboard_api_controller.dart';
import 'package:pms/controller/screen/main_controller.dart';
import 'package:pms/core/constants/app_enums.dart';
import 'package:pms/core/service/api_service.dart';
import 'package:pms/data/models/RegisterRequest.dart';
import 'package:pms/data/models/drug.dart';
import 'package:pms/data/models/drugRequest.dart';
import 'package:pms/data/models/pharmacy.dart';

class DashboardScreenController extends GetxController {
////////////////////////////////////////  adding a  drugggg
  int selectedDosageForm = 0;
  int selectedManufactureCompany = 0;
  int selectedCategory = 0;

  List<Category> scientificMaterialsList = [];
  List<Category> therapeuticEffectsList = [];
  List<Category> indicationsList = [];

  List<bool> selectedScientificMaterials = [];
  List<bool> selectedTherapeuticEffects = [];
  List<bool> selectedIndications = [];

  TextEditingController brandNameController = TextEditingController();
  TextEditingController scientificNameController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController titerController = TextEditingController();

  ///////////////////////////////////////////////////
  TextEditingController newindication = TextEditingController();
  TextEditingController newtherpic = TextEditingController();
  TextEditingController newsientific = TextEditingController();

  //////////////////////////////////////////////////
  String selectedRowDetails = '';
  MainController mainController = Get.find();
  DashboardApiController apiController = DashboardApiController(Get.find());
  StatusView statusView = StatusView.none;
  bool isCreateMode = false;
  int selectedId = 0;

  TextEditingController newCategoryController = TextEditingController();
  TextEditingController updateCategoryController = TextEditingController();

  TextEditingController newnameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  TextEditingController updatenameController = TextEditingController();
  TextEditingController updatunitController = TextEditingController();
  TextEditingController updattypeController = TextEditingController();

  // Data
  List<RegisterRequest> registerRequests = [];
  List<DrugRequest> DrugRequests = [];
  List<Category> categories = [];

  List<Category> indi = [];
  List<Category> categor = [];
  List<Category> manifactor = [];
  List<Category> dosag = [];
  List<Category> seintific = [];
  List<Category> therapeutic = [];

  Category cat = Category(id: 0, name: 'select item'),
      ind = Category(id: 0, name: 'select item'),
      mani = Category(id: 0, name: 'select item'),
      dos = Category(id: 0, name: 'select item'),
      seni = Category(id: 0, name: 'select item'),
      ther = Category(id: 0, name: 'select item');

  List<Category> manufactor = [];
  List<DosageForm> dosageform = [];
  List<Pharmacy> pharmacy = [];
  List<Drug> drugs = [];

// TypeAndUnit tu=;
// TypeAndUnit typeAndUnit =[];

  @override
  void onInit() {
    getAllRegistrationRequestsPending();
    super.onInit();
  }

  getAllRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllRegistrationRequests();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        registerRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllpharmacies() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllpharmacies();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        pharmacy = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllrepositories() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllrepositories();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        pharmacy = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllDrugs() async {
    indi = await getAllIndication();
    categor = await getAllCategories();
    manifactor = await getAllManufactureCompany();
    dosag = await getAllDosageForm();
    seintific = await getAllScientificMaterial();
    therapeutic = await getAllTherapeuticEffects();
    selectedIndications = List.generate(indi.length, (index) => false);
    selectedScientificMaterials =
        List.generate(seintific.length, (index) => false);
    selectedTherapeuticEffects =
        List.generate(therapeutic.length, (index) => false);
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugs();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        drugs = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllRegistrationRequestsPending() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllRegistrationRequestsPending();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        registerRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllRegistrationRequestsAccepting() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllRegistrationRequestsAccepting();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        registerRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllRegistrationRequestsRejecting() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllRegistrationRequestsRejecting();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        registerRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllRegistrationRequestsArchived() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllRegistrationRequestsArchived();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        registerRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugRequests();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        DrugRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        Get.showSnackbar(const GetSnackBar(
          title: "Fail",
          message: "something went wrong ",
        ));
        update();
      },
    );
  }

  getAllDrugRequestsPending() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugRequestsPending();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        DrugRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllDrugRequestsRejecting() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugRequestsRejecting();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        DrugRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        Get.showSnackbar(const GetSnackBar(
          title: "Fail",
          message: "something went wrong ",
        ));
        update();
      },
    );
  }

  getAllDrugRequestsAccepting() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugRequestsAccepting();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        DrugRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        Get.showSnackbar(const GetSnackBar(
          title: "Fail",
          message: "something went wrong ",
        ));
        update();
      },
    );
  }

  getAllDrugRequestsArchived() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDrugRequestsArchived();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        DrugRequests = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        Get.showSnackbar(const GetSnackBar(
          title: "Fail",
          message: "something went wrong ",
        ));
        update();
      },
    );
  }

  getAllCategories() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllCategories();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        categories = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return categories;
  }

  createCategory() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createCategory(
            name: newCategoryController.text);
      },
      onSuccess: (response) async {
        await getAllCategories();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateCategory() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateCategory(
          id: selectedId,
          name: updateCategoryController.text,
        );
      },
      onSuccess: (response) async {
        await getAllCategories();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteCategory() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteCategory(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllCategories();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllManufactureCompany() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllManufactureCompany();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        manufactor = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return manufactor;
  }

  createManufactureCompany() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createManufactureCompany(
            name: newCategoryController.text);
      },
      onSuccess: (response) async {
        await getAllManufactureCompany();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateManufactureCompany() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateManufactureCompany(
          id: selectedId,
          name: updateCategoryController.text,
        );
      },
      onSuccess: (response) async {
        await getAllManufactureCompany();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteManufactureCompany() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteManufactureCompany(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllManufactureCompany();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getUnitsAndTypes() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getUnitsAndTypes();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        drugs = response; ////////////////////////  should  change it to tu
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllDosageForm() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllDosageForm();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        dosageform = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return convertDosageFormsToCategories(dosageform);
  }

  createDosageForm() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createDosageForm(
            name: newnameController.text,
            unit: unitController.text,
            type: typeController.text);
      },
      onSuccess: (response) async {
        await getAllDosageForm();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteDosageForm() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteDosageForm(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDosageForm();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateDosageForm() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateDosageForm(
          id: selectedId,
          name: updatenameController.text,
          unit: updatunitController.text,
          type: updattypeController.text,
        );
      },
      onSuccess: (response) async {
        await getAllDosageForm();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllScientificMaterial() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllScientificMaterial();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        categories = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return categories;
  }

  createScientificMaterial() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createScientificMaterial(
            name: newsientific.text);
      },
      onSuccess: (response) async {
        await getAllScientificMaterial();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateScientificMaterial() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateScientificMaterial(
          id: selectedId,
          name: updateCategoryController.text,
        );
      },
      onSuccess: (response) async {
        await getAllScientificMaterial();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteScientificMaterial() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteScientificMaterial(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllScientificMaterial();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllIndication() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllIndication();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        categories = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return categories;
  }

  createAllIndication() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createAllIndication(
            name: newindication.text);
      },
      onSuccess: (response) async {
        await getAllIndication();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateAllIndication() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateAllIndication(
          id: selectedId,
          name: updateCategoryController.text,
        );
      },
      onSuccess: (response) async {
        await getAllIndication();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteIndication() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteIndication(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllIndication();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  getAllTherapeuticEffects() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.getAllTherapeuticEffects();
      },
      onSuccess: (response) async {
        statusView = StatusView.none;
        categories = response;
        update();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
    return categories;
  }

  createTherapeuticEffects() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createTherapeuticEffects(
            name: newtherpic.text);
      },
      onSuccess: (response) async {
        await getAllTherapeuticEffects();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  updateTherapeuticEffects() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.updateTherapeuticEffects(
          id: selectedId,
          name: updateCategoryController.text,
        );
      },
      onSuccess: (response) async {
        await getAllTherapeuticEffects();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteTherapeuticEffects() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteTherapeuticEffects(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllTherapeuticEffects();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  // getUnitsAndTypes() async {
  //   statusView = StatusView.loading;
  //   update();
  //   ApiService.sendRequest(
  //     request: () async {
  //       return await apiController.getUnitsAndTypes();
  //     },
  //     onSuccess: (response) async {
  //       statusView = StatusView.none;
  //       TypeAndUnit = response;
  //       update();
  //     },
  //     onFailure: (statusView, message) async {
        // Get.showSnackbar(GetSnackBar(
        //     title: "Fail",
        //     message:message.text,
        //   ));
  //       this.statusView = statusView;
  //       update();
  //     },
  //   );
  // }

  acceptRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.acceptRegistrationRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllRegistrationRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  rejectRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.rejectRegistrationRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllRegistrationRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  archivedRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.archivedRegistrationRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllRegistrationRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  unarchivedRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.unarchivedRegistrationRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllRegistrationRequestsArchived();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteRegistrationRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteRegistrationRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllRegistrationRequestsArchived();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteDrug() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteDrug(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugs();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  acceptDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.acceptDrugRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  rejectDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.rejectDrugRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  archivedDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.archivedDrugRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugRequestsPending();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  deleteDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.deleteDrugRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugRequestsArchived();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  unarchivedDrugRequests() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.unarchivedDrugRequests(
          id: selectedId,
        );
      },
      onSuccess: (response) async {
        await getAllDrugRequestsArchived();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }

  void updateSelectedRowDetails(String details) {
    selectedRowDetails = details; // No need for setState here
  }

  List<Category> convertDosageFormsToCategories(List<DosageForm> dosageForms) {
    List<Category> categories = [];

    for (DosageForm dosageForm in dosageForms) {
      categories.add(Category(id: dosageForm.id, name: dosageForm.name));
    }

    return categories;
  }

  List<Category> convertDosageFormsToType(List<DosageForm> dosageForms) {
    List<Category> categories = [];

    for (DosageForm dosageForm in dosageForms) {
      categories.add(Category(id: dosageForm.id, name: dosageForm.type));
    }

    return categories;
  }

  List<Category> convertDosageFormsToUnit(List<DosageForm> dosageForms) {
    List<Category> categories = [];

    for (DosageForm dosageForm in dosageForms) {
      categories.add(Category(id: dosageForm.id, name: dosageForm.unit));
    }

    return categories;
  }

  createNewDug() async {
    statusView = StatusView.loading;
    update();
    ApiService.sendRequest(
      request: () async {
        return await apiController.createNewDug(
          brand: brandNameController.text,
          scientific: scientificNameController.text,
          capacity: capacityController.text,
          titer: titerController.text,
          isPrescription: true,
          contraindications: 'allergy',
          sideEffects: 'headache',
          categoryId: cat.id!,
          dosageFormId: dos.id!,
          manufactureCompanyId: mani.id!,
          scientificMaterials: seintific
              .where((element) => selectedScientificMaterials[element.id!])
              .toList()
              .map((e) => e.id!)
              .toList(),
          therapeuticEffects: therapeutic
              .where((element) => selectedScientificMaterials[element.id!])
              .toList()
              .map((e) => e.id!)
              .toList(),
          indications: indi
              .where((element) => selectedScientificMaterials[element.id!])
              .toList()
              .map((e) => e.id!)
              .toList(),
        );
      },
      onSuccess: (response) async {
        await getAllDrugs();
      },
      onFailure: (statusView, message) async {
        Get.showSnackbar(GetSnackBar(
            title: "Fail",
            message:message.text,
          ));
        this.statusView = statusView;
        update();
      },
    );
  }
}
