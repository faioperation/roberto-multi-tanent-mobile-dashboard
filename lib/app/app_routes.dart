import 'package:flutter/material.dart';
import 'package:roberto/features/Auth/screen/login_screen.dart';
import 'package:roberto/features/Auth/screen/forgot_screen.dart';
import 'package:roberto/features/Auth/screen/verify_screen.dart';
import 'package:roberto/features/Auth/screen/reset_screen.dart';
import 'package:roberto/features/Auth/screen/successful_screen.dart';
import 'package:roberto/common/dashboard_layout.dart';
import 'package:roberto/common/user_role.dart';

class Routes {
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String verifyOtp = '/verify-otp';
  static const String resetPassword = '/reset-password';
  static const String success = '/success';
  
  // Dashboard Routes
  static const String overview = '/overview';
  static const String inbox = '/inbox';
  static const String orderBooking = '/order-booking';
  static const String aiAgent = '/ai-agent';
  static const String pricing = '/pricing';
  static const String campaigns = '/campaigns';
  static const String crmLeads = '/crm-leads';
  static const String subscriptions = '/subscriptions';
  static const String management = '/management';
  static const String settings = '/settings';
  static const String demoBookings = '/demo-bookings';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Standard dashboard case
    if (isDashboardRoute(settings.name ?? '')) {
      final args = settings.arguments as Map<String, dynamic>? ?? {};
      final role = args['role'] as UserRole? ?? UserRole.businessOwner;
      final branch = args['assignedBranch'] as Map<String, String>?;
      
      return PageRouteBuilder(
        settings: settings,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) => DashboardShell(
          role: role,
          assignedBranch: branch,
          initialItem: getDashboardItem(settings.name ?? ''),
        ),
      );
    }

    switch (settings.name) {
      case login:
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case forgotPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotScreen(),
        );
      case verifyOtp:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const VerifyScreen(),
        );
      case resetPassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ResetScreen(),
        );
      case success:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SuccessfulScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static bool isDashboardRoute(String name) {
    return [
      overview,
      inbox,
      orderBooking,
      aiAgent,
      pricing,
      campaigns,
      crmLeads,
      subscriptions,
      management,
      settings,
      demoBookings,
      notifications
    ].contains(name);
  }

  static String getDashboardItem(String route) {
    switch (route) {
      case overview: return 'Overview';
      case inbox: return 'Inbox';
      case orderBooking: return 'Order Booking';
      case aiAgent: return 'AI Agent';
      case pricing: return 'Pricing';
      case campaigns: return 'Campaigns';
      case crmLeads: return 'CRM & Leads';
      case subscriptions: return 'Subscriptions';
      case management: return 'Management';
      case settings: return 'Settings';
      case demoBookings: return 'Demo Bookings';
      case notifications: return 'Notifications';
      default: return 'Overview';
    }
  }
}
