import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/app_shell.dart';
import '../../../../core/widgets/feature_card.dart';
import '../../../../core/widgets/section_title.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeroSection(),
            const SizedBox(height: 32),
            const SectionTitle(
              title: 'Converters',
              subtitle: 'Choose a conversion tool to get started',
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth >= 1024) {
                  crossAxisCount = 4;
                } else if (constraints.maxWidth >= 600) {
                  crossAxisCount = 2;
                } else {
                  crossAxisCount = 1;
                }

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: crossAxisCount == 1 ? 1.8 : 1.1,
                  children: const [
                    FeatureCard(
                      title: 'Length Converter',
                      description:
                          'Convert between mm, cm, m, km, inch, ft, yard, and mile.',
                      icon: Icons.straighten,
                      route: AppRoutes.length,
                      color: AppColors.primary,
                    ),
                    FeatureCard(
                      title: 'Weight Converter',
                      description:
                          'Convert between mg, gram, kg, oz, and lb.',
                      icon: Icons.fitness_center,
                      route: AppRoutes.weight,
                      color: AppColors.secondary,
                    ),
                    FeatureCard(
                      title: 'Temperature Converter',
                      description:
                          'Convert between Celsius, Fahrenheit, and Kelvin.',
                      icon: Icons.thermostat,
                      route: AppRoutes.temperature,
                      color: Color(0xFFF59E0B),
                    ),
                    FeatureCard(
                      title: 'Echo Tester',
                      description:
                          'Test the backend API with echo requests and view responses.',
                      icon: Icons.repeat,
                      route: AppRoutes.echo,
                      color: Color(0xFF8B5CF6),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.secondary.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.swap_horiz,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unit Converter Pro',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Fast, accurate unit conversions powered by a production REST API. '
                  'Convert length, weight, and temperature with ease.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
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
