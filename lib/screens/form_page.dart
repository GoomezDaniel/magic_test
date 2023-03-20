import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:magic_test/blocs/magic_bloc/magic_bloc.dart';
import 'package:magic_test/routes/app_navigator_states.dart';
import 'package:magic_test/utils/design/my_assets.dart';
import 'package:magic_test/utils/design/my_styles.dart';

import '../utils/field_validators.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  /// Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Name controller
  final controllerName = TextEditingController();

  /// Surname controller
  final controllerSurname = TextEditingController();

  /// Email controller
  final controllerEmail = TextEditingController();

  /// Birthdate controller
  final controllerBirthDate = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MagicBloc, MagicState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(MyAssets.logo),
                    const Spacer(),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Name
                          TextFormField(
                            controller: controllerName,
                            style: MyStyles.subtitle,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: MyStyles.subtitle,
                            ),
                            validator: (String? value) {
                              if (!FieldValidators.isNameValid(value!)) {
                                return 'No valid name';
                              }
                              return null;
                            },
                          ),

                          /// Surname
                          TextFormField(
                            controller: controllerSurname,
                            style: MyStyles.subtitle,
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Surname',
                              hintStyle: MyStyles.subtitle,
                            ),
                            validator: (String? value) {
                              if (!FieldValidators.isNameValid(value!)) {
                                return 'No valid surname';
                              }
                              return null;
                            },
                          ),

                          /// Email
                          TextFormField(
                            controller: controllerEmail,
                            style: MyStyles.subtitle,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: MyStyles.subtitle,
                            ),
                            validator: (String? value) {
                              if (!FieldValidators.isEmailValid(value!)) {
                                return 'No valid email';
                              }
                              return null;
                            },
                          ),

                          /// Date
                          TextFormField(
                            readOnly: true,
                            style: MyStyles.subtitle,
                            controller: controllerBirthDate,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: 'Birthdate',
                              hintStyle: MyStyles.subtitle,
                            ),
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.utc(2000, 1),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                setState(() {
                                  controllerBirthDate.text =
                                      DateFormat('yyyy-MM-dd').format(date);
                                });
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'No valid birthdate';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: InkWell(
              onTap: () {
                /// Unfocus text field
                FocusScope.of(context).unfocus();

                /// Validate form
                if (formKey.currentState!.validate()) {
                  /// Load data
                  if (state.magicData.isEmpty) {
                    context.read<MagicBloc>().add(MagicLoadData());
                  }

                  /// Change page
                  context.read<AppNavigatorController>().showList();
                }
              },
              child: CircleAvatar(
                radius: 40,
                child: Text(
                  'Go!',
                  style: MyStyles.title.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
