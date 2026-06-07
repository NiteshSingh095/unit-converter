import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../utils/validators.dart';
import 'app_card.dart';
import 'app_dropdown.dart';
import 'app_text_field.dart';
import 'error_widget.dart';
import 'primary_button.dart';
import 'section_title.dart';

class ConverterForm extends StatelessWidget {
  const ConverterForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formKey,
    required this.valueController,
    required this.units,
    required this.fromUnit,
    required this.toUnit,
    required this.isLoading,
    required this.errorMessage,
    required this.resultText,
    required this.onConvert,
    required this.onFromChanged,
    required this.onToChanged,
  });

  final String title;
  final String subtitle;
  final GlobalKey<FormState> formKey;
  final TextEditingController valueController;
  final List<String> units;
  final RxString fromUnit;
  final RxString toUnit;
  final RxBool isLoading;
  final RxnString errorMessage;
  final RxnString resultText;
  final VoidCallback onConvert;
  final void Function(String?) onFromChanged;
  final void Function(String?) onToChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: title, subtitle: subtitle),
                const SizedBox(height: 24),
                AppTextField(
                  controller: valueController,
                  label: 'Value',
                  hint: 'Enter value to convert',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: Validators.validateNumericValue,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppDropdown(
                    label: 'From Unit',
                    value: fromUnit.value,
                    items: units,
                    onChanged: onFromChanged,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AppDropdown(
                    label: 'To Unit',
                    value: toUnit.value,
                    items: units,
                    onChanged: onToChanged,
                  ),
                ),
                const SizedBox(height: 28),
                Obx(
                  () => PrimaryButton(
                    label: 'Convert',
                    icon: Icons.swap_horiz,
                    isLoading: isLoading.value,
                    onPressed: onConvert,
                  ),
                ),
                const SizedBox(height: 24),
                Obx(() {
                  if (errorMessage.value != null) {
                    return AppErrorWidget(
                      message: errorMessage.value!,
                      onRetry: onConvert,
                    );
                  }
                  if (resultText.value != null) {
                    return AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Result',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            resultText.value!,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
