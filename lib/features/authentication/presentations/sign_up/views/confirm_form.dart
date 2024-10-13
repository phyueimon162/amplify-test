import 'package:amplify/common/presentations/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:amplify/common/presentations/style/app_dimensions.dart';
import 'package:amplify/common/presentations/theme/app_themes.dart';
import 'package:amplify/core/util/validators/validator.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_controller.dart';
import 'package:amplify/features/authentication/presentations/sign_up/controllers/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmForm extends ConsumerStatefulWidget {
  final String destination;
  final String mediumName;

  const ConfirmForm(
      {required this.destination, required this.mediumName, super.key});

  @override
  ConsumerState<ConfirmForm> createState() => _ConfirmSignUpFormState();
}

class _ConfirmSignUpFormState extends ConsumerState<ConfirmForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController confirmSignUpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpState signUpState = ref.watch(signUpControllerProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
              'A confirmation code has been sent to \n ${widget.destination}.'
              '\nPlease check your ${widget.mediumName} for the code.',
              textAlign: TextAlign.center,
              style: AppTheme.of(context).titleMedium),
          SizedBox(height: AppDimensions.h20(context)),
          TextFormField(
            controller: confirmSignUpController,
            validator: Validator.nullCheckValidator,
            maxLength: 6,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
          SizedBox(height: AppDimensions.h20(context)),
          CustomElevatedButton(
            label: 'Confirm',
            state: signUpState.actionState.state,
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              ref
                  .read(signUpControllerProvider.notifier)
                  .confirmEvent(confirmSignUpController.text);
            },
          ),
        ],
      ),
    );
  }
}
