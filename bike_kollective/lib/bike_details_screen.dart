import 'package:bike_kollective/data/model/issue.dart';
import 'package:bike_kollective/data/provider/active_ride.dart';
import 'package:bike_kollective/data/provider/active_user.dart';
import 'package:bike_kollective/data/provider/available_bikes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bike_kollective/data/model/bike.dart';
import 'bike_details_view.dart';
import 'report_issue_dialog.dart';

// Define the BikeDetailsScreen widget
class BikeDetailsScreen extends ConsumerWidget {
  final BikeModel bike;

  const BikeDetailsScreen({super.key, required this.bike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeUser = ref.watch(activeUserProvider);
    final starRating = bike.getRating(); // This should return a value suitable for the RatingBarIndicator

    return Scaffold(
      appBar: AppBar(
        title: Text(bike.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BikeDetailsView(
              bike: bike, // Include the BikeDetailsView component
              rating: starRating, // Pass the rating to the BikeDetailsView
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showReportIssueDialog(context, (IssueTag issue, String comment) async {
                      await ref.read(availableBikesProvider.notifier).reportBike(IssueModel.newIssue(
                          reporter: activeUser!.docRef!,
                          bike: bike.docRef!,
                          tags: [issue],
                          comment: comment));
                      // Leave this bike and go back to the list of available bikes
                      Navigator.pushReplacementNamed(context, '/home');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Report Issue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(activeRideProvider.notifier).startRide(bike);
                    checkOutBike(context, bike);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Check Out',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Show a pop-out with lock code
void checkOutBike(BuildContext context, BikeModel bike) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
            child: Text(
          'Enjoy your ride!',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )), // Center the title
        content: SingleChildScrollView(
          // Allow content to scroll
          child: Column(
            children: [
              const Text(
                'The lock combination is:',
                textAlign: TextAlign.center, // Center align text
              ),
              Text(
                ' ${bike.code}',
                textAlign: TextAlign.center, // Center align text
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                'You have 8 hours to return the bike',
                textAlign: TextAlign.center, // Center align text
              ),
            ],
          ),
        ),
        actions: [
          Center(
            // Center the buttons
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the pop-out dialog box
                // TODO: fix transition
                //Navigator.pushReplacementNamed(context, '/currentRide'); // Navigate back to current ride screen
              },
              child: const Text('OK'),
            ),
          ),
        ],
      );
    },
  );
}