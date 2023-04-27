import 'package:flutter/material.dart';
import 'package:visita/model/nearby_places_model.dart';

class NearbyPlaces extends StatelessWidget {
  const NearbyPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyPlaces.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 135,
            width: double.maxFinite,
            child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => TouristDetailsPage(
                  //         image: nearbyPlaces[index].image,
                  //       ),
                  //     ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          nearbyPlaces[index].image,
                          height: double.maxFinite,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nearbyPlaces[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(nearbyPlaces[index].location),
                            const SizedBox(height: 10),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                Text(
                                  nearbyPlaces[index].rating,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
