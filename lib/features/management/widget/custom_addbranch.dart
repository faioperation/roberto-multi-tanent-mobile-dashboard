import 'package:flutter/material.dart';
import 'package:roberto/app/app_color.dart';
import 'package:roberto/features/Auth/widget/custom_textfield.dart';

class CustomAddbranch extends StatelessWidget {
  const CustomAddbranch({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 900;

    return AlertDialog(
      backgroundColor: AppColor.white,

      //  Responsive width
      contentPadding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24 : 16,
        vertical: 20,
      ),

      titlePadding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24 : 16,
        vertical: 16,
      ),

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Create New Branch",
                style: TextStyle(fontSize: isDesktop ? 20 : 16),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.close, size: 20),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            "Create New Branch",
            style: TextStyle(
              fontSize: isDesktop ? 14 : 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),

      content: SizedBox(
        width: isDesktop ? 450 : double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("User Name "),
              const SizedBox(height: 6),
              const CustomTextfield(hintText: "John smith"),

              const SizedBox(height: 15),

              const Text("User Mail"),
              const SizedBox(height: 6),
              const CustomTextfield(hintText: "john12@gmail.com"),

              const SizedBox(height: 15),

              const Text("Address "),
              const SizedBox(height: 6),
              const CustomTextfield(hintText: "New York,NY"),

              const SizedBox(height: 15),

              const Text("Status"),
              const SizedBox(height: 6),
              const CustomTextfield(hintText: "Active"),

              const SizedBox(height: 15),

            ],
          ),
        ),
      ),

      actionsPadding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24 : 12,
        vertical: 10,
      ),

      actions: [
        isDesktop
            ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: _buttons(context),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buttons(context),
        ),
      ],
    );
  }

  List<Widget> _buttons (BuildContext context) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Cancel",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      const SizedBox(width: 10, height: 10),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Create User",
          style: TextStyle(color: AppColor.white),
        ),
      ),
      const SizedBox(height: 15),
    ];
  }
}