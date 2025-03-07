import 'package:flutter/material.dart';

class CustomAppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? companyLogo;
  final Widget? leading;
  final Widget? actionButton;
  final Widget? drawerContent;

  const CustomAppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
    this.companyLogo,
    this.leading,
    this.actionButton,
    this.drawerContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (companyLogo != null) companyLogo!,
            if (companyLogo != null) SizedBox(width: 8),
            Text(title),
          ],
        ),
        actions: [
          if (actionButton != null) actionButton!,
          if (actions != null) ...actions!,
        ],
        leading: leading,
      ),
      drawer: Drawer(
        child: drawerContent ?? Center(child: Text('Drawer Content')),
      ),
      body: body,
    );
  }
}
