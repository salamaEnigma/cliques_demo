import 'package:flutter/material.dart';
import 'package:cliques_demo/models/clique.dart';

class DetailsScreen extends StatelessWidget {
  final Clique clique;

  DetailsScreen(this.clique);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clique Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              clique.photo ?? 'placeholder_photo_url',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              clique.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              clique.description ?? 'No description',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Divider(),
            Text(
              'Members [1]',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread elements horizontally
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          clique.photo ?? 'placeholder_photo_url',
                        ),
                        radius: 20,
                        foregroundColor: Color.fromRGBO(255, 255, 255, (i + 1) / 3),
                      ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement the logic to view members
                  },
                  child: Text('View Members'),
                ),
              ],
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight, // Align the buttons to the right
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement the logic to join the clique
                    },
                    child: Text('Join'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Implement the logic to leave the clique
                    },
                    child: Text('Leave'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}