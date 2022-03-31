import 'package:flutter/material.dart';
import 'package:getwage/Models/recruiter_category.dart';
import 'package:getwage/Models/user_type.dart';
import 'package:getwage/Models/worker_category.dart';
import 'package:getwage/NewUser/info_screen_two.dart';
import 'package:getwage/constants.dart';

class InfoScreenOne extends StatefulWidget {
  const InfoScreenOne({Key? key}) : super(key: key);

  @override
  State<InfoScreenOne> createState() => _InfoScreenOneState();
}

class _InfoScreenOneState extends State<InfoScreenOne> {
  int mainIndex = 3;
  void changeIndex(int idx) {
    setState(() {
      mainIndex = idx;
    });
  }

  List<String> cateIndex = [];
  List<String> hireCateIndex = [];
  void addCateToList(String idx, bool isHire) {
    isHire
        ? hireCateIndex.contains(idx)
            ? hireCateIndex.remove(idx)
            : hireCateIndex.add(idx)
        : cateIndex.contains(idx)
            ? cateIndex.remove(idx)
            : cateIndex.add(idx);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            namaste(context),
            SizedBox(
              height: 150,
              width: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, idx) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                        onTap: () {
                          changeIndex(idx);
                        },
                        child: selectableButton(mainIndex == idx ? true : false,
                            UserType.userTypes[idx].titile)),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            mainIndex == 3
                ? Container()
                : const Text(
                    "Choose Category",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            const SizedBox(height: 10),
            mainIndex == 1
                ? Container(
                    padding: const EdgeInsets.all(10),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: kCard,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: WorkerCategory.workerCategories.length,
                        itemBuilder: (context, idx) {
                          return GestureDetector(
                            onTap: () => addCateToList(
                                WorkerCategory.workerCategories[idx].titile,
                                false),
                            child: CheckBoxTile(
                                WorkerCategory.workerCategories[idx].titile,
                                cateIndex.contains(WorkerCategory
                                    .workerCategories[idx].titile)),
                          );
                        }),
                  )
                : mainIndex == 0
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: kCard,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                RecuriterCategory.recrutersCategories.length,
                            itemBuilder: (context, idx) {
                              return GestureDetector(
                                onTap: () => addCateToList(
                                    RecuriterCategory
                                        .recrutersCategories[idx].title,
                                    true),
                                child: CheckBoxTile(
                                    RecuriterCategory
                                        .recrutersCategories[idx].title,
                                    hireCateIndex.contains(RecuriterCategory
                                        .recrutersCategories[idx].title)),
                              );
                            }),
                      )
                    : const SizedBox(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Column(
          children: [
            cirleButton(() {
              mainIndex == 0
                  ? hireCateIndex.isEmpty
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text("Please select atleast one category"),
                        ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoScreenTwo(
                                  usertype:
                                      mainIndex == 0 ? "Employer" : "Worder",
                                  userCategories: mainIndex == 0
                                      ? hireCateIndex
                                      : cateIndex)),
                        )
                  : cateIndex.isEmpty
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text("Please select atleast one category"),
                        ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoScreenTwo(
                                  usertype:
                                      mainIndex == 0 ? "Employer" : "Worder",
                                  userCategories: mainIndex == 0
                                      ? hireCateIndex
                                      : cateIndex)),
                        );
            }, Icons.arrow_forward_ios, false),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
