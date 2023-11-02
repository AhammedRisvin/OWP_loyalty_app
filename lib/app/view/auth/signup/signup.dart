import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/auth/signup_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';

import 'package:owp_loyalty/app/utils/size_config.dart';

import '../../widgets/common_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();
  final countryfocus = FocusNode();
  final statefocus = FocusNode();
  final cityfocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whitColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        child: SingleChildScrollView(
          child: Column(children: [
            Constants().sbHt40,
            Constants().sbHt30,
            Column(
              children: [
                Constants().sbHt10,
                SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/owp_loyalty-logo.png",
                      fit: BoxFit.fill,
                    )),
                Constants().sbHt5,
                Text("BY OWPMF",
                    style: customTextStyle(
                        color: Constants.mainColor,
                        size: 9.0.sp,
                        weight: FontWeight.w400)),
              ],
            ),
            Constants().sbHt10,
            Text("Create Account",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 20.0.sp,
                    weight: FontWeight.w500)),
            Constants().sbHt30,
            Constants().sbHt30,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldWidget(
                    label: "User Name",
                    controller: controller.userNameTextEditor,
                    keybordType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "FirstName is required!";
                      }
                      return null;
                    },
                  ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Last Name",
                  //   controller: controller.lastNameTextEditor,
                  //   keybordType: TextInputType.name,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "LastName is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  Constants().sbHt10,
                  Constants().sbHt5,
                  CustomTextFieldWidget(
                    label: "Email",
                    controller: controller.emailTextEditor,
                    keybordType: TextInputType.emailAddress,
                    validator: (value) {
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
                      if (value == null || value.isEmpty) {
                        return "Email is required!";
                      } else if (!emailRegex
                          .hasMatch(controller.emailTextEditor.text)) {
                        return 'Not a  valid email!';
                      }
                      return null;
                    },
                  ),
                  Constants().sbHt10,
                  Constants().sbHt5,
                  CustomTextFieldWidget(
                    label: "Password",
                    controller: controller.passwordTextEditor,
                    keybordType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required!";
                      }
                      return null;
                    },
                  ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Date Of Birth",
                  //   controller: controller.dobNameTextEditor,
                  //   keybordType: TextInputType.datetime,
                  //   suffixIcon: const Icon(
                  //     Icons.calendar_today,
                  //     size: 18,
                  //     color: Constants.mainColor,
                  //   ),
                  //   onTap: () {
                  //     controller.onDOB(context);
                  //   },
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please select the date';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // Text("Address Details :-",
                  //     style: customTextStyle(
                  //         color: Constants.blackColor,
                  //         size: 14.sp,
                  //         weight: FontWeight.w400)),
                  Constants().sbHt10,
                  Constants().sbHt5,
//searchable dropdown -country
                  // Obx(
                  //   () => CommonSearchField(
                  //     controller: controller.countryofResidenceTextEditor,
                  //     // hintStyle: context.textTheme.bodySmall!.copyWith(
                  //     //   fontSize: 16,
                  //     //   color: AppColors.grey,
                  //     // ),
                  //     readOnly: false,
                  //     icon: Icons.keyboard_arrow_down_rounded,
                  //     label: "Country of Residence",
                  //     iconColor: Constants.mainColor,
                  //     searchStyle: context.textTheme.bodySmall!
                  //         .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  //     onSearchTextChanged: (query) {
                  //       final filter = controller.getCountryList
                  //           .where((element) => element.name
                  //               .toString()
                  //               .toLowerCase()
                  //               .contains(query.toLowerCase()))
                  //           .toList();
                  //       return filter
                  //           .map((e) => SearchFieldListItem<String>(
                  //               e.name.toString(), e.name.toString(),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 16.0, horizontal: 12),
                  //                 child: Text(e.name.toString(),
                  //                     style: context.textTheme.bodySmall!
                  //                         .copyWith(
                  //                             fontSize: 14,
                  //                             fontWeight: FontWeight.w400)),
                  //               )))
                  //           .toList();
                  //     },
                  //     key: const Key("countryKey"),
                  //     hint: 'Country of Residence',
                  //     suggestionsDecoration: SuggestionDecoration(
                  //         border: Border.all(color: Constants.greyColor),
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10))),
                  //     suggestions: controller.getCountryList
                  //         .map(
                  //           (e) => SearchFieldListItem<String>(
                  //             e.name.toString(),
                  //             e.name.toString(),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical: 16.0, horizontal: 12),
                  //               child: Text(
                  //                 e.name.toString(),
                  //                 style: context.textTheme.bodySmall!.copyWith(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //     focusNode: countryfocus,
                  //     onSuggestionTap: (p0) async {
                  //       log(p0.toString());
                  //       controller.countryofResidenceTextEditor.clear();
                  //       controller.countryofResidenceTextEditor.text =
                  //           p0.value.toString();
                  //       controller.getSelectedCountryId();
                  //       controller.selectedValue = p0.value.toString();

                  //       controller.getStateandCityList();
                  //       countryfocus.unfocus();
                  //     },
                  //   ),
                  // ),
                  // customDropdownMethod(
                  //     type: "Country of Residence",
                  //     onSaved: (value) {
                  //       controller.getSelectedCountryId();
                  //       controller.selectedValue = value.toString();
                  //       controller.countryofResidenceTextEditor.clear();
                  //       controller.countryofResidenceTextEditor.text =
                  //           value.toString();
                  //       controller.getStateandCityList();
                  //     },
                  //     items: controller.countryList),
                  // Constants().sbHt10,
                  // Constants().sbHt5,

//searchable dropdown -state
                  // Obx(
                  //   () => CommonSearchField(
                  //     controller: controller.stateTextEditor,
                  //     readOnly: false,
                  //     icon: Icons.keyboard_arrow_down_rounded,
                  //     label: "States",
                  //     iconColor: Constants.mainColor,
                  //     searchStyle: context.textTheme.bodySmall!
                  //         .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  //     onSearchTextChanged: (query) {
                  //       final filter = controller.getStateList
                  //           .where((element) => element
                  //               .toString()
                  //               .toLowerCase()
                  //               .contains(query.toLowerCase()))
                  //           .toList();
                  //       return filter
                  //           .map((e) => SearchFieldListItem<String>(
                  //               e.toString(), e.toString(),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 16.0, horizontal: 12),
                  //                 child: Text(e.toString(),
                  //                     style: context.textTheme.bodySmall!
                  //                         .copyWith(
                  //                             fontSize: 14,
                  //                             fontWeight: FontWeight.w400)),
                  //               )))
                  //           .toList();
                  //     },
                  //     key: const Key("stateKey"),
                  //     hint: 'States',
                  //     suggestionsDecoration: SuggestionDecoration(
                  //         border: Border.all(color: Constants.greyColor),
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10))),
                  //     suggestions: controller.getStateList
                  //         .map(
                  //           (e) => SearchFieldListItem<String>(
                  //             e.toString(),
                  //             e.toString(),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical: 16.0, horizontal: 12),
                  //               child: Text(
                  //                 e.toString(),
                  //                 style: context.textTheme.bodySmall!.copyWith(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //     focusNode: statefocus,
                  //     onSuggestionTap: (p0) async {
                  //       controller.stateTextEditor.clear();
                  //       controller.stateTextEditor.text = p0.value.toString();
                  //       controller.selectedValue = p0.value.toString();
                  //       controller.cityList();
                  //       statefocus.unfocus();
                  //     },
                  //   ),
                  // ),
                  // Obx(
                  //   () => customDropdownMethod(
                  //       type: "States",
                  //       onSaved: (value) {
                  //         controller.stateTextEditor.clear();
                  //         controller.stateTextEditor.text = value.toString();
                  //         controller.selectedValue = value.toString();
                  //         controller.cityList();
                  //       },
                  //       items: controller.getStateList),
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
//searchable dropdown -city
                  // Obx(
                  //   () => CommonSearchField(
                  //     controller: controller.cityTextEditor,
                  //     // hintStyle: context.textTheme.bodySmall!.copyWith(
                  //     //   fontSize: 16,
                  //     //   color: AppColors.grey,
                  //     // ),
                  //     readOnly: false,
                  //     icon: Icons.keyboard_arrow_down_rounded,
                  //     label: "City",
                  //     iconColor: Constants.mainColor,
                  //     searchStyle: context.textTheme.bodySmall!
                  //         .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  //     onSearchTextChanged: (query) {
                  //       final filter = controller.getCityList
                  //           .where((element) => element
                  //               .toString()
                  //               .toLowerCase()
                  //               .contains(query.toLowerCase()))
                  //           .toList();
                  //       return filter
                  //           .map((e) => SearchFieldListItem<String>(
                  //               e.toString(), e.toString(),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 16.0, horizontal: 12),
                  //                 child: Text(e.toString(),
                  //                     style: context.textTheme.bodySmall!
                  //                         .copyWith(
                  //                             fontSize: 14,
                  //                             fontWeight: FontWeight.w400)),
                  //               )))
                  //           .toList();
                  //     },
                  //     key: const Key("cityKey"),
                  //     hint: 'City',
                  //     suggestionsDecoration: SuggestionDecoration(
                  //         border: Border.all(color: Constants.greyColor),
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10))),
                  //     suggestions: controller.getCityList
                  //         .map(
                  //           (e) => SearchFieldListItem<String>(
                  //             e.toString(),
                  //             e.toString(),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical: 16.0, horizontal: 12),
                  //               child: Text(
                  //                 e.toString(),
                  //                 style: context.textTheme.bodySmall!.copyWith(
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         )
                  //         .toList(),
                  //     focusNode: cityfocus,
                  //     onSuggestionTap: (p0) async {
                  //       controller.cityTextEditor.clear();
                  //       controller.cityTextEditor.text = p0.value.toString();

                  //       controller.selectedValue = p0.value.toString();

                  //       cityfocus.unfocus();
                  //     },
                  //   ),
                  // ),

                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Street Address",
                  //   controller: controller.streetAdressTextEditor,
                  //   keybordType: TextInputType.text,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Street Address is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Pincode",
                  //   controller: controller.pincodeTextEditor,
                  //   keybordType: TextInputType.text,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Pincode is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Contact No",
                  //   controller: controller.contactNoTextEditor,
                  //   keybordType: TextInputType.number,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Contact No is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Passport No",
                  //   controller: controller.passportNoTextEditor,
                  //   keybordType: TextInputType.text,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Passport No is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // customDropdownMethod(
                  //     type: "Nationality",
                  //     onSaved: (value) {
                  //       controller.selectedValue = value.toString();
                  //       controller.nationalityTextEditor.clear();
                  //       controller.nationalityTextEditor.text =
                  //           value.toString();
                  //     },
                  //     items: controller.countryList),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // Text("Account Details :-",
                  //     style: customTextStyle(
                  //         color: Constants.blackColor,
                  //         size: 14.sp,
                  //         weight: FontWeight.w400)),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  CustomTextFieldWidget(
                    label: "Nationality",
                    onTap: () => showCountryPicker(
                      context: context,
                      showPhoneCode:
                          false, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        print('Select country: ${country.countryCode}');
                        controller.nationalityTextEditor.text =
                            country.countryCode.toString();
                      },
                    ),
                    controller: controller.nationalityTextEditor,
                    keybordType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Bank IBAN No is required!";
                      }
                      return null;
                    },
                  ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // CustomTextFieldWidget(
                  //   label: "Bank Name",
                  //   controller: controller.bankNameTextEditor,
                  //   keybordType: TextInputType.text,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Bank Name is required!";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // Text("Others :-",
                  //     style: customTextStyle(
                  //         color: Constants.blackColor,
                  //         size: 14.sp,
                  //         weight: FontWeight.w400)),
                  // Constants().sbHt10,
                  // Constants().sbHt5,
                  // customDropdownMethod(
                  //     type: "Profession",
                  //     onSaved: (value) {
                  //       controller.selectedValue = value.toString();
                  //       controller.professionTextEditor.clear();
                  //       controller.professionTextEditor.text = value.toString();
                  //     },
                  //     items: controller.professions),
                  // Constants().sbHt20,
                  Constants().sbHt30,
                  CommonButtonWidget(
                    btnName: "Create Account",
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountUser();
                      }
                    },
                  ),
                ],
              ),
            ),
            Constants().sbHt20,
            Text("OR",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 12.0.sp,
                    weight: FontWeight.w500)),
            Constants().sbHt20,
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        backgroundColor: Constants.whitColor,
                        padding: const EdgeInsets.all(8)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Sign in",
                        style: customTextStyle(
                            color: Constants.buttonColor,
                            size: 13.0.sp,
                            weight: FontWeight.w500)))),
            const SizedBox(height: 70),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: customTextStyle(
                    color: Constants.blackColor,
                    size: 9.0.sp,
                    weight: FontWeight.w500),
                children: const <TextSpan>[
                  TextSpan(text: 'By using our services are agreeing to our '),
                  TextSpan(
                      text: 'Terms ',
                      style: TextStyle(color: Color(0xff2959D5))),
                  TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                      text: 'Privacy statement ',
                      style: TextStyle(color: Color(0xff2959D5))),
                ],
              ),
            ),
            Constants().sbHt40
          ]),
        ),
      ),
    );
  }
}
