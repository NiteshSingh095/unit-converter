import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../theme/theme_controller.dart';
import 'health_status_badge.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.title,
    required this.child,
    this.showBackButton = false,
  });

  final String title;
  final Widget child;
  final bool showBackButton;

  static const double _mobileBreakpoint = 600;
  static const double _desktopBreakpoint = 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= _desktopBreakpoint;
        final isMobile = constraints.maxWidth < _mobileBreakpoint;

        if (isDesktop) {
          return _DesktopLayout(
            title: title,
            showBackButton: showBackButton,
            child: child,
          );
        }

        return _MobileLayout(
          title: title,
          showBackButton: showBackButton,
          showBottomNav: isMobile,
          child: child,
        );
      },
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({
    required this.title,
    required this.child,
    required this.showBackButton,
  });

  final String title;
  final Widget child;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const _SideNav(),
          Expanded(
            child: Column(
              children: [
                _AppTopBar(title: title, showBackButton: showBackButton),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({
    required this.title,
    required this.child,
    required this.showBackButton,
    required this.showBottomNav,
  });

  final String title;
  final Widget child;
  final bool showBackButton;
  final bool showBottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: showBottomNav ? null : const _DrawerNav(),
      body: child,
      bottomNavigationBar: showBottomNav ? const _BottomNav() : null,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            )
          : null,
      actions: const [
        HealthStatusBadge(),
        _ThemeToggle(),
        SizedBox(width: 8),
      ],
    );
  }
}

class _AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppTopBar({
    required this.title,
    required this.showBackButton,
  });

  final String title;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          const HealthStatusBadge(),
          const SizedBox(width: 12),
          const _ThemeToggle(),
        ],
      ),
    );
  }
}

class _SideNav extends StatelessWidget {
  const _SideNav();

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    return Container(
      width: 240,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const _LogoHeader(),
          const SizedBox(height: 32),
          ..._navItems.map(
            (item) => _NavItem(
              item: item,
              isSelected: currentRoute == item.route,
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerNav extends StatelessWidget {
  const _DrawerNav();

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: _LogoHeader(),
          ),
          ..._navItems.map(
            (item) => _NavItem(
              item: item,
              isSelected: currentRoute == item.route,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    final currentRoute = Get.currentRoute;
    final mobileItems = _navItems.take(5).toList();
    return NavigationBar(
      selectedIndex: mobileItems.indexWhere((i) => i.route == currentRoute).clamp(0, mobileItems.length - 1),
      onDestinationSelected: (index) => Get.toNamed(mobileItems[index].route),
      destinations: mobileItems
          .map(
            (item) => NavigationDestination(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}

class _LogoHeader extends StatelessWidget {
  const _LogoHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.swap_horiz, color: AppColors.primary, size: 28),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unit Converter',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              'Pro',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.isSelected,
  });

  final _NavItemData item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        leading: Icon(
          item.icon,
          color: isSelected ? AppColors.primary : null,
        ),
        title: Text(
          item.label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? AppColors.primary : null,
          ),
        ),
        selected: isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          if (!isSelected) Get.toNamed(item.route);
          if (Scaffold.maybeOf(context)?.hasDrawer == true) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle();

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => IconButton(
        icon: Icon(
          themeController.isDark ? Icons.light_mode : Icons.dark_mode,
        ),
        tooltip: 'Toggle theme',
        onPressed: themeController.toggleTheme,
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;
}

const List<_NavItemData> _navItems = [
  _NavItemData(label: 'Dashboard', icon: Icons.dashboard_outlined, route: AppRoutes.dashboard),
  _NavItemData(label: 'Length', icon: Icons.straighten, route: AppRoutes.length),
  _NavItemData(label: 'Weight', icon: Icons.fitness_center, route: AppRoutes.weight),
  _NavItemData(label: 'Temperature', icon: Icons.thermostat, route: AppRoutes.temperature),
  _NavItemData(label: 'Echo', icon: Icons.repeat, route: AppRoutes.echo),
  _NavItemData(label: 'About', icon: Icons.info_outline, route: AppRoutes.about),
];
