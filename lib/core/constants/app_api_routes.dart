class AppApiRoute {
  static const String server = "127.0.0.1:8000"; // For Windows

  // Registration
  // Auth
  static const String login = "/admin/login";
  static const String logout = "/admin/logout";

  // Home Page
  // Registration-request
  static const String getAllRegistrationRequests = "/admin/registration-request/get";
  static const String getAllRegistrationRequestsPending = "/admin/registration-request/get-pending";
  static const String getAllRegistrationRequestsAccepting = "/admin/registration-request/get-accepting";
  static const String getAllRegistrationRequestsRejecting = "/admin/registration-request/get-rejecting";
  static const String getAllRegistrationRequestsArchived = "/admin/registration-request/get-archived";

   // Add-Drug-request
  static const String getAllDrugRequests = "/admin/create-medicines-request/get";
  static const String getAllDrugRequestsPending = "/admin/create-medicines-request/get-pending";
  static const String getAllDrugRequestsRejecting = "/admin/create-medicines-request/get-rejecting";
  static const String getAllDrugRequestsAccepting = "/admin/create-medicines-request/get-accepting";
  static const String getAllDrugRequestsArchived = "/admin/create-medicines-request/get-archived";

//

  // clasitications
  static const String getAllCategories = "/admin/category/get-all";
  static const String createCategory = "/admin/category/create";
  static const String updateCategory = "/admin/category/update"; 
    static const String deleteCategory = "/admin/category/delete"; 

  

  static const String getAllManufactureCompany = "/admin/manufacture-company/get-all";
  static const String createManufactureCompany = "/admin/manufacture-company/create";
  static const String updateManufactureCompany = "/admin/manufacture-company/update"; 
  static const String deleteManufactureCompany = "/admin/manufacture-company/delete"; 

  static const String getAllDosageForm = "/admin/dosage-form/get-all";
  static const String createDosageForm = "/admin/dosage-form/create";
  static const String deleteDosageForm = "/admin/dosage-form/delete";
  static const String updateDosageForm = "/admin/dosage-form/update";

  static const String getAllScientificMaterial = "/admin/scientific-material/get-all";
  static const String createScientificMaterial = "/admin/scientific-material/create";
  static const String updateScientificMaterial = "/admin/scientific-material/update"; 
  static const String deleteScientificMaterial = "/admin/scientific-material/delete";



  static const String getAllIndication = "/admin/indication/get-all";
    static const String createAllIndication = "/admin/indication/create";
        static const String updateAllIndication = "/admin/indication/update";
        static const String deleteIndication = "/admin/indication/delete"; 


 static const String getAllTherapeuticEffects = "/admin/therapeutic-effects/get-all";
 static const String createTherapeuticEffects = "/admin/therapeutic-effects/create";
 static const String updateTherapeuticEffects = "/admin/therapeutic-effects/update";
 static const String deleteTherapeuticEffects = "/admin/therapeutic-effects/delete";



  static const String getAllpharmacies = "/admin/pharmacies/get-all";
  static const String getAllrepositories = "/admin/repositories/get-all";
    static const String getAllDrugs = "/admin/medicines/get-all";
    static const String getUnitsAndTypes = "/admin/dosage-form/get-units-types";
    static const String deleteDrug = "/admin/medicines/delete";


  static const String acceptRegistrationRequests = "/admin/registration-request/accept";
  static const String rejectRegistrationRequests = "/admin/registration-request/reject";
  static const String archivedRegistrationRequests = "/admin/registration-request/add-to-archived";
  static const String unarchivedRegistrationRequests = "/admin/registration-request/return-from-archived";
  static const String deleteRegistrationRequests = "/admin/registration-request/delete";

   static const String acceptDrugRequests = "/admin/create-medicines-request/accept";
   static const String rejectDrugRequests = "/admin/create-medicines-request/reject";
   static const String archivedDrugRequests = "/admin/create-medicines-request/add-to-archived";
   static const String deleteDrugRequests = "/admin/create-medicines-request/delete";
   static const String unarchivedDrugRequests = "/admin/create-medicines-request/return-from-archived";


  static const String createNewDug = "/admin/medicines/create";



}
