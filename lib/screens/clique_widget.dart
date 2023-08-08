import 'package:cliques_demo/helpers/dimensions.dart';
import 'package:cliques_demo/models/clique.dart';
import 'package:cliques_demo/screens/details_screen.dart';
import 'package:flutter/material.dart';

List<Clique> generatePlaceholderCliques() {
  return List.generate(100, (index) {
    return Clique(
      id: index.toString(),
      name: 'Clique $index',
      description: 'Description of Clique $index',
      childCliques: [],
      memberIds: [],
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo4ubPoEjlr1TdMBRAvITNA4GxiPZ6qTKo1A&usqp=CAU', // Replace with actual URL or AssetImage
    );
  });
}
class CliqueList extends StatelessWidget {
  final List<Clique> cliques = generatePlaceholderCliques();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Main Cliques',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cliques.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                // Navigate to the new screen when an item is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(cliques[index]), // Replace with your screen
                  ),
                );
              },
              child: Container(
                width: 150,
                padding: EdgeInsets.all(8),
                child: Card(
                  elevation: 3,
                  child: Stack(
                    children: [
                      Container(
                        height: 140, // Adjust the height as needed
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(cliques[index].photo ??
                                'placeholder_photo_url'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40, // Lower the clique name and description
                        left: 8,
                        right: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cliques[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              cliques[index].description ?? 'No description',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 8,
                        right: 8,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  cliques[index].photo ??
                                      'placeholder_photo_url'),
                              radius: 15,
                            ),
                            SizedBox(width: 32),
                            Text(
                              '[1.2k]',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
             ));
            },
          ),
        ),
        SizedBox(height: 16), // Add some spacing below the existing list
        Center(
          child: Text(
            'My Cliques',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(), // Add a divider after the additional text
        Container(
          height: 400,
          width: 300,// Set the desired height for the vertical list
          child: ListView.builder(
            itemCount: cliques.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Text(
                        cliques[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cliques[index].description ?? 'No description',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              cliques[index].photo ?? 'placeholder_photo_url',
                            ),
                            radius: 15,
                          ),
                          SizedBox(width: 200),
                          Text(
                            '[1.2k]',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
