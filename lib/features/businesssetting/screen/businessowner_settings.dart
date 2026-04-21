import 'package:flutter/material.dart';

class BusinessownerSettings extends StatefulWidget {
  const BusinessownerSettings({super.key});

  @override
  State<BusinessownerSettings> createState() => _BusinessownerSettingsState();
}

class _BusinessownerSettingsState extends State<BusinessownerSettings> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff111827),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Manage your system preferences and configurations',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

      ]
    );
  }
}
