import 'package:flutter/material.dart';
import 'package:getwage/Models/job_model.dart';
import 'package:getwage/constants.dart';

import '../components/mapContainer.dart';

class DetailScreen extends StatefulWidget {
  int index;
  DetailScreen({required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    itemCount: JobModel.jobs[widget.index].images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 300,
                        child: Image.network(
                          JobModel.jobs[widget.index].images[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.chevron_left)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.chevron_right)),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      JobModel.jobs[widget.index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text(
                      JobModel.jobs[widget.index].description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kCard,
                      ),
                      child: Text(
                          "Expected Pay Rs " + JobModel.jobs[widget.index].wage,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20),
                    const Text("Posted By"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              JobModel.jobs[widget.index].postedByImage),
                        ),
                        SizedBox(width: 10),
                        Text(JobModel.jobs[widget.index].postedBy)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      child: MapContainer(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 60,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: kAccent,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                "Apply",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              height: 60,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Icon(
                                Icons.message,
                                color: Colors.white,
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
