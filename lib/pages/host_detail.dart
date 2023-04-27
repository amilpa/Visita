import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:visita/model/recommended_places_model.dart';
import 'package:visita/model/host_detail_Images.dart';

class HostDetail extends StatelessWidget {
  const HostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.black,
          // Add on pressed
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.maxFinite,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //Image container
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage("assets/Kuttikanam/House.jpg"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // Name of Host Accomodation
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Name of Accomodation",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                const Spacer(),

                //Chat with Host Button
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    //Chat to be implemented
                    onPressed: () {},
                    iconSize: 20,
                    icon: const Icon(Ionicons.chatbubble_ellipses_outline),
                  ),
                ),

                //Rating Star
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "4.6",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Icon(
                      Ionicons.star,
                      color: Colors.yellow[800],
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),

            // Host Details
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Price

                  Text(
                    "₹ Price",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Location : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Facilities",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Beds : 2"),
                        Text("Bathroom : 1"),
                        Text("Food : Veg & NonVeg "),
                      ],
                    ),
                  ),
                  Text("Host Name : Name ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text("Contact : Contact Number",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 15),
                  Text(
                    "Gallery",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),

            //Images of Host Facility
            SizedBox(
              height: 150,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 220,
                      child: Card(
                        elevation: 0.4,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              hostimages[index].image,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                  itemCount: recommendedPlaces.length),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
              ),
              child: const Text(
                "Book",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
