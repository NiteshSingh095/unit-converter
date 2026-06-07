import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_shell.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/section_title.dart';
import '../controllers/echo_controller.dart';

class EchoPage extends GetView<EchoController> {
  const EchoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Echo Tester',
      showBackButton: true,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(
                    title: 'API Echo Tester',
                    subtitle: 'Send a test request to the backend echo endpoint',
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    controller: controller.textController,
                    label: 'Message',
                    hint: 'Enter text to echo',
                    validator: (v) => Validators.validateRequired(v, field: 'Message'),
                  ),
                  const SizedBox(height: 24),
                  Obx(
                    () => PrimaryButton(
                      label: 'Send Echo',
                      icon: Icons.send,
                      isLoading: controller.isLoading.value,
                      onPressed: controller.sendEcho,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Obx(() {
                    if (controller.errorMessage.value != null) {
                      return AppErrorWidget(
                        message: controller.errorMessage.value!,
                        onRetry: controller.sendEcho,
                      );
                    }
                    final result = controller.echoResult.value;
                    if (result == null) return const SizedBox.shrink();

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 600;
                        final requestCard = _JsonCard(
                          title: 'Request',
                          json: result.requestJson,
                          color: AppColors.primary,
                        );
                        final responseCard = _JsonCard(
                          title: 'Response',
                          json: result.responseJson,
                          color: AppColors.secondary,
                        );

                        if (isWide) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: requestCard),
                              const SizedBox(width: 16),
                              Expanded(child: responseCard),
                            ],
                          );
                        }
                        return Column(
                          children: [
                            requestCard,
                            const SizedBox(height: 16),
                            responseCard,
                          ],
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _JsonCard extends StatelessWidget {
  const _JsonCard({
    required this.title,
    required this.json,
    required this.color,
  });

  final String title;
  final String json;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.code, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBackground
                  : AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              json,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
