import 'package:flutter/material.dart';
import 'package:evaluation/common/extensions/context_extension.dart';
import 'package:evaluation/features/base/presentation/widgets/app_text_field.dart';
import 'package:evaluation/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  final searchController = TextEditingController();
  final List<Map<String, String>> requests = [
    {
      'type': 'A vacation request',
      'date': 'Saturday 6/24/2024',
      'status': 'unacceptable',
    },
    {
      'type': 'Sick leave request',
      'date': 'Monday 6/25/2024',
      'status': 'pending',
    },
    {
      'type': 'Work from home request',
      'date': 'Wednesday 6/26/2024',
      'status': 'approved',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16),
            _buildToggleButtons(),
            SizedBox(height: 20),
            _buildSectionTitle('Anayltes'),
            _buildAnalyticItems(),
            SizedBox(height: 20),
            _buildSectionTitle('Requests'),
            SizedBox(height: 16),
            _buildRequestsList(),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0066FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          // Background Image in the bottom-right
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              Assets.images.blueBG.path, // Replace with your image asset path
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
              fit: BoxFit.contain, // Ensure the image scales well
            ),
          ),
          // Foreground content
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(Assets.images.avatar.path),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'George Mikhaiel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Team Manager',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(Assets.images.notifications.path),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1 / 5 / 2024   -   15 / 5 / 1445',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                AppTextField(
                  controller: searchController,
                  fieldLabel: 'Search',
                  fillColor: Color(0xFF3972f6),
                  textColor: Colors.white,
                  suffixIcon: Assets.images.search,
                  needRightPadding: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Image.asset(
                        Assets.images.dismissal.path,
                        width: 34,
                        height: 34,
                      ),
                    ),
                    Text(
                      'Dismissal',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Image.asset(
                        Assets.images.presence.path,
                        width: 34,
                        height: 34,
                      ),
                    ),
                    Text(
                      'Presence',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnalyticItems() {
    final List<Map<String, String>> analytics = [
      {
        'title': 'Workdays',
        'value': '20 days / 28 days',
        'image': Assets.images.workdays.path,
      },
      {
        'title': 'Absence',
        'value': '20 days',
        'image': Assets.images.absence.path,
      },
      {
        'title': 'Entitlements',
        'value': '1 discount',
        'image': Assets.images.entitlements.path,
      },
      {
        'title': 'Deductions',
        'value': '0 discount',
        'image': Assets.images.deductions.path,
      },
      {
        'title': 'Holiday request',
        'value': '1 Request',
        'image': Assets.images.holiday.path,
      },
      {
        'title': 'Vacations balance',
        'value': '9 days x 1 year',
        'image': Assets.images.vacations.path,
      },
      {
        'title': 'Hours of delay',
        'value': '2 hours',
        'image': Assets.images.hours.path,
      },
      {
        'title': 'Overtime working hours',
        'value': '25 hours',
        'image': Assets.images.overtime.path,
      },
    ];

    return Column(
      children: analytics
          .map(
            (item) => Container(
              height: 110, // Set height for each item
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(14), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2), // Subtle shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16), // Inner padding
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align items to the top
                  children: [
                    // Leading Image in the top-left
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(
                          item['image']!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10), // Spacing between image and text
                    // Title and Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            item['value']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildRequestsList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return _buildRequestItem(
            requests[index]['type']!,
            requests[index]['date']!,
            requests[index]['status']!,
          );
        },
      ),
    );
  }

  Widget _buildRequestItem(String type, String date, String status) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Type of Request: $type',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('The Date: $date', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text(
            'Order Status: $status',
            style: TextStyle(
              color: status == 'approved'
                  ? Colors.green
                  : status == 'pending'
                      ? Colors.orange
                      : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
