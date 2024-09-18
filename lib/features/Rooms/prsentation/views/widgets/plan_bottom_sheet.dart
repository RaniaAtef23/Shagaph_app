import 'package:flutter/material.dart';

void showPlanBottomSheet(BuildContext context, Function(String) onPlanSelected) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
    ),
    builder: (BuildContext context) {
      return _PlanBottomSheet(onPlanSelected: onPlanSelected);
    },
  );
}

class _PlanBottomSheet extends StatefulWidget {
  final Function(String) onPlanSelected;

  const _PlanBottomSheet({required this.onPlanSelected});

  @override
  __PlanBottomSheetState createState() => __PlanBottomSheetState();
}

class __PlanBottomSheetState extends State<_PlanBottomSheet> {
  String _selectedPlan = '60.0 EGP/Hour'; // Default selected plan

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06, // Responsive padding
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select your plan',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045, // Responsive font size
              fontWeight: FontWeight.w500,
              fontFamily: 'Comfortaa',
              color: const Color(0xff1B1B1B),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _buildPlanRadio(
            value: '60.0 EGP/Hour',
            label: '60.0 EGP/Hour',
            icon: Icons.access_time_outlined,
          ),
          _buildPlanRadio(
            value: '500.0 EGP/Day',
            label: '500.0 EGP/Day',
            icon: Icons.calendar_today,
          ),
          _buildPlanRadio(
            value: '8,000.0 EGP/Month',
            label: '8,000.0 EGP/Month',
            icon: Icons.date_range,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: double.infinity, // Ensure button takes full width
            child: ElevatedButton(
              onPressed: () {
                widget.onPlanSelected(_selectedPlan); // Notify parent widget of the selected plan
                Navigator.pop(context); // Close the bottom sheet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff20473E),
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Select Plan',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04, // Responsive font size
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanRadio({
    required String value,
    required String label,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPlan = value;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.07, // Responsive circle size
          height: MediaQuery.of(context).size.width * 0.07,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _selectedPlan == value
                  ? const Color(0xffF04C29)
                  : const Color(0xffF04C29),
              width: _selectedPlan == value ? 8 : 2,
            ),
          ),
          child: Center(
            child: _selectedPlan == value
                ? Container(
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.width * 0.04,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            )
                : const SizedBox.shrink(),
          ),
        ),
      ),
      title: Row(
        children: [
          Icon(icon,
              color: _selectedPlan == value
                  ? const Color(0xffF04C29)
                  : const Color(0xff6B6B6B),
              size: MediaQuery.of(context).size.width * 0.05), // Responsive icon size
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Text(
            label,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04, // Responsive font size
              fontWeight: FontWeight.w400,
              fontFamily: 'Comfortaa',
              color: _selectedPlan == value
                  ? const Color(0xffF04C29)
                  : const Color(0xff6B6B6B),
            ),
          ),
        ],
      ),
    );
  }
}
