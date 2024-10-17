
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pms/core/constants/app_colors.dart';
import 'package:pms/core/constants/app_enums.dart';

class WidgetsUtils {
  static void showSnackBar(
      {required String title,
      required String message,
      SnackBarType snackBarType = SnackBarType.info,
      int duration = 5}) {
    Get.snackbar(title, message,
        icon: Icon(
          snackBarType == SnackBarType.info
              ? Icons.done
              : snackBarType == SnackBarType.error
              ? Icons.error
              : Icons.warning,
          color: AppColors.primary90,
        ),
        barBlur: 5,
        isDismissible: true,
        colorText: AppColors.primary90,
        backgroundColor: snackBarType == SnackBarType.info
            ? AppColors.success30
            : snackBarType == SnackBarType.error
            ? AppColors.danger30
            : AppColors.warning30,
        duration: Duration(seconds: duration),
        animationDuration: const Duration(seconds: 1));
  }

  static void showFormDialog(BuildContext context,
      {required String title,
      GlobalKey<FormState>? formKey,
      List<Widget> children = const [],
      String okText = 'Save',
      String cancelText = 'Cancel',
      double insetPaddingHorizontal = 30,
      Function()? btnOkOnPress,
      Function()? btnCancelOnPress,
      bool hasButtonsAction = true,
      bool barrierDismissible = true}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.symmetric(horizontal: insetPaddingHorizontal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            shrinkWrap: true,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: AppColors.primary90,
                ),
              ),
              const Divider(
                thickness: 2,
                height: 20,
              ),
              ...children,
              if (hasButtonsAction)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MaterialButton(
                          onPressed: () {
                            if (btnCancelOnPress != null) {
                              btnCancelOnPress.call();
                            }
                            Navigator.pop(context);
                          },
                          color: AppColors.gray,
                          disabledColor: AppColors.gray,
                          disabledTextColor: Colors.white54,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            cancelText,
                            style: const TextStyle(
                                fontSize: 20, color: AppColors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: MaterialButton(
                          onPressed: btnOkOnPress,
                          color: AppColors.primary50,
                          disabledColor: AppColors.danger50,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            okText,
                            style: const TextStyle(
                                fontSize: 20, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static void showAlertDialog(BuildContext context,
      {required String title,
      List<Widget> children = const [],
      String? subTitle,
      String okText = 'Ok',
      String cancelText = 'Cancel',
      String dialogType = 'default',
      Function()? btnOkOnPress,
      Function()? btnCancelOnPress,
      bool hasButtonsAction = true,
      bool barrierDismissible = true}) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        clipBehavior: Clip.hardEdge,
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(
              thickness: 2,
              height: 10,
            ),
          ],
        ),
        children: [
          if (subTitle != null)
            Center(
                child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            )),
          ...children,
          if (hasButtonsAction)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: MaterialButton(
                      onPressed: () {
                        if (btnCancelOnPress != null) {
                          btnCancelOnPress.call();
                        }
                        Navigator.pop(context);
                      },
                      color: AppColors.gray,
                      disabledColor: AppColors.gray,
                      disabledTextColor: Colors.white54,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        cancelText,
                        style: const TextStyle(
                            fontSize: 20, color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: MaterialButton(
                      onPressed: () {
                        if (btnOkOnPress != null) {
                          btnOkOnPress.call();
                        }
                        Navigator.pop(context);
                      },
                      color: dialogType == 'delete'
                          ? AppColors.danger50
                          : AppColors.primary50,
                      disabledColor: AppColors.danger50,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        okText,
                        style: const TextStyle(
                            fontSize: 20, color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
