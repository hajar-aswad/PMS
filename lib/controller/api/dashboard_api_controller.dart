import 'package:pms/core/constants/app_api_routes.dart';
import 'package:pms/core/service/api_service.dart';
import 'package:pms/core/utils/logic_utils.dart';
import 'package:pms/data/models/RegisterRequest.dart';
import 'package:pms/data/models/drug.dart';
import 'package:pms/data/models/drugRequest.dart';
import 'package:pms/data/models/pharmacy.dart';

class DashboardApiController {
  ApiService apiService;

  DashboardApiController(this.apiService);

  Future<dynamic> getAllRegistrationRequests() async {
    LogicUtils.log('Start getAllRegistrationRequests() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllRegistrationRequests);
    LogicUtils.log('End getAllRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => RegisterRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllRegistrationRequestsPending() async {
    LogicUtils.log('Start getAllRegistrationRequestsPending() Api');
    var response = await apiService.get(
        url: AppApiRoute.getAllRegistrationRequestsPending);
    LogicUtils.log('End getAllRegistrationRequestsPending() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => RegisterRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllRegistrationRequestsAccepting() async {
    LogicUtils.log('Start getAllRegistrationRequestsAccepting() Api');
    var response = await apiService.get(
        url: AppApiRoute.getAllRegistrationRequestsAccepting);
    LogicUtils.log('End getAllRegistrationRequestsAccepting() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => RegisterRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllRegistrationRequestsRejecting() async {
    LogicUtils.log('Start getAllRegistrationRequestsRejecting() Api');
    var response = await apiService.get(
        url: AppApiRoute.getAllRegistrationRequestsRejecting);
    LogicUtils.log('End getAllRegistrationRequestsRejecting() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => RegisterRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllRegistrationRequestsArchived() async {
    LogicUtils.log('Start getAllRegistrationRequestsArchived() Api');
    var response = await apiService.get(
        url: AppApiRoute.getAllRegistrationRequestsArchived);
    LogicUtils.log('End getAllRegistrationRequestsArchived() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => RegisterRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugRequests() async {
    LogicUtils.log('Start getAllDrugRequests() Api');
    var response = await apiService.get(url: AppApiRoute.getAllDrugRequests);
    LogicUtils.log('End getAllDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DrugRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugRequestsPending() async {
    LogicUtils.log('Start getAllDrugRequestsPending() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllDrugRequestsPending);
    LogicUtils.log('End getAllDrugRequestsPending() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DrugRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugRequestsRejecting() async {
    LogicUtils.log('Start getAllDrugRequestsRejecting() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllDrugRequestsRejecting);
    LogicUtils.log('End getAllDrugRequestsRejecting() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DrugRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugRequestsAccepting() async {
    LogicUtils.log('Start getAllDrugRequestsAccepting() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllDrugRequestsAccepting);
    LogicUtils.log('End getAllDrugRequestsAccepting() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DrugRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugRequestsArchived() async {
    LogicUtils.log('Start getAllDrugRequestsArchived() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllDrugRequestsArchived);
    LogicUtils.log('End getAllDrugRequestsArchived() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DrugRequest.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllCategories() async {
    LogicUtils.log('Start getAllCategories() Api');
    var response = await apiService.get(url: AppApiRoute.getAllCategories);
    LogicUtils.log('End getAllCategories() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Category.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createCategory({required String name}) async {
    LogicUtils.log('Start createCategory() Api');
    var response =
        await apiService.post(url: AppApiRoute.createCategory, body: {
      'name': name.toString(),
    });
    LogicUtils.log('End createCategory() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateCategory({
    required int id,
    required String name,
  }) async {
    LogicUtils.log('Start updateCategory() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateCategory, body: {
      'id': id.toString(),
      'name': name.toString(),
    });
    LogicUtils.log('End updateCategory() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteCategory({required int id}) async {
    LogicUtils.log('Start deleteCategory() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteCategory, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteCategory() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllManufactureCompany() async {
    LogicUtils.log('Start getAllManufactureCompany() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllManufactureCompany);
    LogicUtils.log('End getAllManufactureCompany() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Category.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createManufactureCompany({required String name}) async {
    LogicUtils.log('Start createManufactureCompany() Api');
    var response =
        await apiService.post(url: AppApiRoute.createManufactureCompany, body: {
      'name': name.toString(),
    });
    LogicUtils.log('End createManufactureCompany() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateManufactureCompany({
    required int id,
    required String name,
  }) async {
    LogicUtils.log('Start updateManufactureCompany() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateManufactureCompany, body: {
      'id': id.toString(),
      'name': name.toString(),
    });
    LogicUtils.log('End updateManufactureCompany() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteManufactureCompany({required int id}) async {
    LogicUtils.log('Start deleteManufactureCompany() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteManufactureCompany, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteManufactureCompany() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDosageForm() async {
    LogicUtils.log('Start getAllDosageForm() Api');
    var response = await apiService.get(url: AppApiRoute.getAllDosageForm);
    LogicUtils.log('End getAllDosageForm() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => DosageForm.fromJson(e))
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createDosageForm(
      {required String name,
      required String unit,
      required String type}) async {
    LogicUtils.log('Start createDosageForm() Api');
    var response =
        await apiService.post(url: AppApiRoute.createDosageForm, body: {
      'name': name.toString(),
      'unit': unit.toString(),
      'type': type.toString(),
    });
    LogicUtils.log('End createDosageForm() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteDosageForm({required int id}) async {
    LogicUtils.log('Start deleteDosageForm() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteDosageForm, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteDosageForm() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateDosageForm(
      {required int id,
      required String name,
      required String type,
      required String unit}) async {
    LogicUtils.log('Start updateDosageForm() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateDosageForm, body: {
      'id': id.toString(),
      'name': name.toString(),
      'type': type.toString(),
      'unit': unit.toString(),
    });
    LogicUtils.log('End updateDosageForm() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllScientificMaterial() async {
    LogicUtils.log('Start getAllScientificMaterial() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllScientificMaterial);
    LogicUtils.log('End getAllScientificMaterial() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Category.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createScientificMaterial({required String name}) async {
    LogicUtils.log('Start createScientificMaterial() Api');
    var response =
        await apiService.post(url: AppApiRoute.createScientificMaterial, body: {
      'name': name.toString(),
    });
    LogicUtils.log('End createScientificMaterial() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateScientificMaterial({
    required int id,
    required String name,
  }) async {
    LogicUtils.log('Start updateScientificMaterial() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateScientificMaterial, body: {
      'id': id.toString(),
      'name': name.toString(),
    });
    LogicUtils.log('End updateScientificMaterial() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteScientificMaterial({required int id}) async {
    LogicUtils.log('Start deleteScientificMaterial() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteScientificMaterial, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteScientificMaterial() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllIndication() async {
    LogicUtils.log('Start getAllIndication() Api');
    var response = await apiService.get(url: AppApiRoute.getAllIndication);
    LogicUtils.log('End getAllIndication() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Category.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createAllIndication({required String name}) async {
    LogicUtils.log('Start createAllIndication() Api');
    var response =
        await apiService.post(url: AppApiRoute.createAllIndication, body: {
      'name': name.toString(),
    });
    LogicUtils.log('End createAllIndication() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateAllIndication({
    required int id,
    required String name,
  }) async {
    LogicUtils.log('Start updateAllIndication() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateAllIndication, body: {
      'id': id.toString(),
      'name': name.toString(),
    });
    LogicUtils.log('End updateAllIndication() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteIndication({required int id}) async {
    LogicUtils.log('Start deleteIndication() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteIndication, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteIndication() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllTherapeuticEffects() async {
    LogicUtils.log('Start getAllTherapeuticEffects() Api');
    var response =
        await apiService.get(url: AppApiRoute.getAllTherapeuticEffects);
    LogicUtils.log('End getAllTherapeuticEffects() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Category.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> updateTherapeuticEffects({
    required int id,
    required String name,
  }) async {
    LogicUtils.log('Start updateTherapeuticEffects() Api');
    var response =
        await apiService.post(url: AppApiRoute.updateTherapeuticEffects, body: {
      'id': id.toString(),
      'name': name.toString(),
    });
    LogicUtils.log('End updateTherapeuticEffects() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createTherapeuticEffects({required String name}) async {
    LogicUtils.log('Start createTherapeuticEffects() Api');
    var response =
        await apiService.post(url: AppApiRoute.createTherapeuticEffects, body: {
      'name': name.toString(),
    });
    LogicUtils.log('End createTherapeuticEffects() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteTherapeuticEffects({required int id}) async {
    LogicUtils.log('Start deleteTherapeuticEffects() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteTherapeuticEffects, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteTherapeuticEffects() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllpharmacies() async {
    LogicUtils.log('Start getAllpharmacies() Api');
    var response = await apiService.get(url: AppApiRoute.getAllpharmacies);
    LogicUtils.log('End getAllpharmacies() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Pharmacy.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllrepositories() async {
    LogicUtils.log('Start getAllrepositories() Api');
    var response = await apiService.get(url: AppApiRoute.getAllrepositories);
    LogicUtils.log('End getAllrepositories() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Pharmacy.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getAllDrugs() async {
    LogicUtils.log('Start getAllDrugs() Api');
    var response = await apiService.get(url: AppApiRoute.getAllDrugs);
    LogicUtils.log('End getAllDrugs() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List).map((e) => Drug.fromJson(e)).toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteDrug({required int id}) async {
    LogicUtils.log('Start deleteDrug() Api');
    var response = await apiService.post(url: AppApiRoute.deleteDrug, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteDrug() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> getUnitsAndTypes() async {
    LogicUtils.log('Start getUnitsAndTypes() Api');
    var response = await apiService.get(url: AppApiRoute.getUnitsAndTypes);
    LogicUtils.log('End getUnitsAndTypes() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return (map['data'] as List)
            .map((e) => Pharmacy.fromJson(
                e)) ////////////////////change pharmacy to uniteandtyppes
            .toList();
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> acceptRegistrationRequests({required int id}) async {
    LogicUtils.log('Start acceptRegistrationRequests() Api');
    var response = await apiService
        .post(url: AppApiRoute.acceptRegistrationRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End acceptRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> rejectRegistrationRequests({required int id}) async {
    LogicUtils.log('Start rejectRegistrationRequests() Api');
    var response = await apiService
        .post(url: AppApiRoute.rejectRegistrationRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End rejectRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> archivedRegistrationRequests({required int id}) async {
    LogicUtils.log('Start archivedRegistrationRequests() Api');
    var response = await apiService
        .post(url: AppApiRoute.archivedRegistrationRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End archivedRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> unarchivedRegistrationRequests({required int id}) async {
    LogicUtils.log('Start unarchivedRegistrationRequests() Api');
    var response = await apiService
        .post(url: AppApiRoute.unarchivedRegistrationRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End unarchivedRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteRegistrationRequests({required int id}) async {
    LogicUtils.log('Start deleteRegistrationRequests() Api');
    var response = await apiService
        .post(url: AppApiRoute.deleteRegistrationRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteRegistrationRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> acceptDrugRequests({required int id}) async {
    LogicUtils.log('Start acceptDrugRequests() Api');
    var response =
        await apiService.post(url: AppApiRoute.acceptDrugRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End acceptDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> rejectDrugRequests({required int id}) async {
    LogicUtils.log('Start rejectDrugRequests() Api');
    var response =
        await apiService.post(url: AppApiRoute.rejectDrugRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End rejectDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> archivedDrugRequests({required int id}) async {
    LogicUtils.log('Start archivedDrugRequests() Api');
    var response =
        await apiService.post(url: AppApiRoute.archivedDrugRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End archivedDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> deleteDrugRequests({required int id}) async {
    LogicUtils.log('Start deleteDrugRequests() Api');
    var response =
        await apiService.post(url: AppApiRoute.deleteDrugRequests, body: {
      'id': id.toString(),
    });
    LogicUtils.log('End deleteDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> unarchivedDrugRequests({required int id}) async {
    LogicUtils.log('Start unarchivedDrugRequests() Api');
    var response =
        await apiService.post(url: AppApiRoute.unarchivedDrugRequests, body: {
      'id': id.toString(),
    });

    LogicUtils.log('End unarchivedDrugRequests() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }

  Future<dynamic> createNewDug({
    required String brand,
    required String scientific,
    required String capacity,
    required String titer,
    required bool isPrescription,
    required String contraindications,
    required String sideEffects,
    required int categoryId,
    required int dosageFormId,
    required int manufactureCompanyId,
    required List<int> scientificMaterials,
    required List<int> therapeuticEffects,
    required List<int> indications,
  }) async {
    LogicUtils.log('Start createNewDug() Api');
    var response = await apiService.post(url: AppApiRoute.createNewDug, body: {
      'brand_name': brand.toString(),
      'scientific_name': scientific.toString(),
      'capacity': capacity.toString(),
      'titer': titer.toString(),
      'is_prescription': isPrescription ? 1 : 0,
      'contraindications': contraindications.toString(),
      'side_effects': sideEffects.toString(),
      'category_id': categoryId.toString(),
      'dosage_form_id': dosageFormId.toString(),
      'manufacture_company_id': manufactureCompanyId.toString(),
      'scientific_materials': scientificMaterials.toString(),
      'therapeutic_effects': therapeuticEffects.toString(),
      'indications': indications.toString(),
    });
    LogicUtils.log('End createCategory() Api: $response');
    return response.fold((l) => l, (map) {
      if (map['success']) {
        return null;
      }
      return ValidationMessage(map['message']);
    });
  }
}
