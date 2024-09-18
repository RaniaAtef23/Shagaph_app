import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  final String logoAsset;
  final String backButtonRoute;

  const Header({
    super.key,
    required this.logoAsset,
    required this.backButtonRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBackButton(context),
        _buildLogo(context),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.05 * MediaQuery.of(context).size.height, left: 0.05 * MediaQuery.of(context).size.width),
      child: Row(
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).go(backButtonRoute),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.05 * MediaQuery.of(context).size.height),
      child: Image.asset(
        logoAsset,
        width: 0.4 * MediaQuery.of(context).size.width,
        height: 0.4 * MediaQuery.of(context).size.height,
      ),
    );
  }
}
