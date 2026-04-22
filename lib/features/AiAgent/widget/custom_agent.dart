import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roberto/app/app_color.dart';

class CustomAgent extends StatefulWidget {
  const CustomAgent({super.key});

  @override
  State<CustomAgent> createState() => _CustomAgentState();
}

class _CustomAgentState extends State<CustomAgent> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/agent.svg',
                width: 23,
                height: 23,
                color: AppColor.black,
              ),
              const SizedBox(width: 8),

              const Text(
                "AI Agent Status",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          const Text(
            "Your AI agent is ready to configure and train.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 27),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AI Agent ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "AI is handling conversations automatically",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              Transform.scale(
                scale: 0.70,
                child: Switch(
                  value: isOn,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                  activeColor: AppColor.mini,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
