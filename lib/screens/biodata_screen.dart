import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pr3_sky_scrapper_app/models/biodata_models.dart';

import '../helpers/api_helper.dart';

class BioDataScreen extends StatefulWidget {
  const BioDataScreen({Key? key}) : super(key: key);

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  late Future<BioData?> fecthBioData;

  TextStyle mainTextStyle = TextStyle(
    color: Colors.deepPurple,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  TextStyle subTextStyle = TextStyle(
    color: Colors.indigo,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
    fecthBioData = APIHelper.apiHelper.fetchBioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'BioData',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/gra_bg.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          FutureBuilder(
            future: fecthBioData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                BioData data = snapshot.data as BioData;

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(data.profilePicture),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${data.firstName} ${data.lastName}",
                            style: mainTextStyle,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            data.gender,
                            style: subTextStyle,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: Colors.indigo,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                data.dob.split("T")[0],
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Icon(
                                Icons.account_circle_sharp,
                                color: Colors.indigo,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Age : ${data.age}",
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Colors.indigo,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                data.phoneNumber,
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: Colors.indigo,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 30,
                                child: Text(
                                  data.emailId,
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.indigo,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${data.city},\n${data.state}, \n${data.country}",
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Icon(
                                Icons.post_add,
                                color: Colors.indigo,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${data.postCode}",
                                style: mainTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                    child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ],
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
