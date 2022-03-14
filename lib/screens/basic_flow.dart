import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cw2_941786/poses.dart';

class BasicFlowPage extends StatefulWidget {
  BasicFlowPage({required this.poseList});
  final PoseList poseList;
  @override
  _BasicFlowPageState createState() => _BasicFlowPageState();
}

class _BasicFlowPageState extends State<BasicFlowPage> {
  bool prevButtonDisabled = true;
  bool nextButtonDisabled = false;
  bool isBreathHintSwitched = false;
  int _totalPoses = 12;
  late List<PoseDetails> _poses;
  int _currentPageNo = 0;
  int _delayTime = 0;
  late Timer _delayTimer;

  //just making sure that the total number of poses
  //is retrieved from the list and not the hardcoded value
  //also need to get the list of poses from the list.
  //this is because if we change it later, it will not
  //affect the UI code (i.e. this page)
  @override
  void initState() {
    super.initState();
    _totalPoses = widget.poseList.poses.length;
    _poses = widget.poseList.poses;
  }

  //tells you what to do when we click on the -> next button
  //basically identify the next pose to navigate to
  //and if the timer is set, start the timer (for it to
  //auto navigate to the next page)
  //and update all the button status
  void gotoNextPage() {
    setState(() {
      if (_currentPageNo == (_totalPoses - 1)) {
        _currentPageNo = 0;
      } else {
        _currentPageNo++;
      }
      initDelayTimer();
      checkAndUpdateButtonStatus();
    });
  }

  //this is the timer code
  //we set the timer to a value between 0 and 15
  //(no real reason for that..just that it might take
  //15 secs to do a pose)
  //and then accordingly navigate to the next pose
  //and ensure that we do not loop through
  void initDelayTimer() {
    _delayTimer = new Timer(Duration(seconds: (_delayTime)), () {
      setState(() {});
      if (_delayTime != 0) {
        if (_currentPageNo < _totalPoses - 1) {
          gotoNextPage();
        }
      }
    });
  }

  void startTimer() {
    setState(() {
      _delayTime = 4;
    });
    initDelayTimer();
  }

  void stopTimer() {
    setState(() {
      _delayTime = 0;
    });
    initDelayTimer();
  }

  //tells you what to do when you press <- prev button
  //just like the next button, need to ensure that the
  //change stops at the first pose and the buttons
  //are updated accordingly.
  //unlike the next button, this doesn't trigger the
  //timer in anyway.
  void gotoPrevPage() {
    setState(() {
      if (_currentPageNo == 0) {
        _currentPageNo = 0;
      } else {
        _currentPageNo--;
      }
      checkAndUpdateButtonStatus();
    });
  }

  //updates all the buttons on the page
  //the prev, next, info, about, main etc.
  //depending on which page/pose we are in
  //at the moment.
  void checkAndUpdateButtonStatus() {
    if (_currentPageNo == 0) {
      prevButtonDisabled = true;
    } else {
      prevButtonDisabled = false;
    }
  }

  //Returns the current page's image
  String getCurrentPageImage() {
    String returnVal = _poses.elementAt(_currentPageNo).image;
    return returnVal;
  }

  //Returns the current page's heading
  String getCurrentPageHeading() {
    String returnVal = _poses.elementAt(_currentPageNo).name;
    return returnVal;
  }

  //Returns the current page's description
  String getCurrentPageDescription() {
    String returnVal = _poses.elementAt(_currentPageNo).process;
    return returnVal;
  }

  String getCurrentPageBenefits() {
    String returnVal = _poses.elementAt(_currentPageNo).benefits;
    return returnVal;
  }

  String getCurrentPageBreathing() {
    String returnVal = _poses.elementAt(_currentPageNo).breathing;
    return returnVal;
  }

  String getCurrentPagebPrecaution() {
    String returnVal = _poses.elementAt(_currentPageNo).precaution;
    return returnVal;
  }

  //Returns the current PoseDetails object
  PoseDetails getCurrentPose() {
    return _poses.elementAt(_currentPageNo);
  }

  String getPoseIndex() {
    var poseIndex = _currentPageNo + 1;
    return '$poseIndex';
  }

  Future<void> _buildPoseInfoPopup(PoseDetails pose) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pose Info- ' + getCurrentPageHeading()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Description',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))),
                Text(getCurrentPageDescription()),
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Breathing',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))),
                Text(getCurrentPageBreathing()),
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Benefits',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))),
                Text(getCurrentPageBenefits().length > 1
                    ? getCurrentPageBenefits()
                    : 'Unavailable'),
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Precaution',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))),
                Text(getCurrentPagebPrecaution().length > 1
                    ? getCurrentPagebPrecaution()
                    : "Unavailable"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Building the UI for the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          elevation: 0.0,
          title: Text(getPoseIndex() + '. ' + getCurrentPageHeading()),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Container(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () =>
                            prevButtonDisabled ? null : gotoPrevPage(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Prev'),
                          ],
                        ),
                      ),
                      _currentPageNo == (_totalPoses - 1)
                          ? TextButton(
                              onPressed: () => gotoNextPage(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Start a new cycle'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            )
                          : TextButton(
                              onPressed: () => gotoNextPage(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Next'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                            ),
                    ],
                  )),
              InteractiveViewer(
                  clipBehavior: Clip.none,
                  child: AspectRatio(
                      aspectRatio: 1.15,
                      child: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          margin: EdgeInsets.only(top: 20.0, bottom: 50.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: AssetImage(getCurrentPageImage()),
                              fit: BoxFit.cover,
                            ),
                          )))),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Switch(
                                        value: isBreathHintSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isBreathHintSwitched = value;
                                          });
                                        },
                                        activeTrackColor:
                                            Colors.lightGreenAccent,
                                        activeColor: Colors.green,
                                      ),
                                      Text(getCurrentPageHeading(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: Colors.white)),
                                      IconButton(
                                        iconSize: 30.0,
                                        tooltip: 'Pose info',
                                        color: Colors.white,
                                        onPressed: () => _buildPoseInfoPopup(
                                            getCurrentPose()),
                                        icon: Icon(
                                          Icons.info,
                                        ),
                                      )
                                    ])),
                            isBreathHintSwitched
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Row(children: [
                                      Text('Breathing: ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.white)),
                                      Flexible(
                                          child: Text(getCurrentPageBreathing(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Colors.white70)))
                                    ]))
                                : Text(''),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 80.0,
                                  tooltip: 'Prev page',
                                  color: Colors.white,
                                  onPressed: () => prevButtonDisabled
                                      ? null
                                      : gotoPrevPage(),
                                  icon: Icon(
                                    Icons.arrow_left,
                                  ),
                                ),
                                _delayTime > 0
                                    ? IconButton(
                                        iconSize: 80.0,
                                        tooltip: 'Stop timer',
                                        color: Colors.white,
                                        onPressed: () => stopTimer(),
                                        icon: Icon(
                                          Icons.pause,
                                        ),
                                      )
                                    : IconButton(
                                        iconSize: 80.0,
                                        tooltip: 'Start 8s timer',
                                        color: Colors.white,
                                        onPressed: () => startTimer(),
                                        icon: Icon(
                                          Icons.play_arrow,
                                        ),
                                      ),
                                IconButton(
                                  iconSize: 80.0,
                                  tooltip: 'Next page',
                                  color: Colors.white,
                                  onPressed: () => gotoNextPage(),
                                  icon: Icon(
                                    Icons.arrow_right,
                                  ),
                                ),
                              ],
                            ))
                          ])))
            ]))));
  }
}
