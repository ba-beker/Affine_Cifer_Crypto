import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> with TickerProviderStateMixin {
  TextEditingController _aController = TextEditingController();
  TextEditingController _bController = TextEditingController();
  TextEditingController _daController = TextEditingController();
  TextEditingController _dbController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  TextEditingController _dtextController = TextEditingController();
  String notification = 'Please enter a and b';
  String dnotification = 'Please enter a and b';
  //
  String positionNb(List<String> L, int pos) {
    return L[pos];
  }

  String _dresult = '';
  String _result = '';
  List<String> T = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'j',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
  // late int ac;
  // late int i;
  // late int nb;
  // late int r;
  // late int md;

  int indexLeter(List E, String later) {
    int L = 0;
    while (later != E[L]) {
      L += 1;
    }
    return L;
  }

  //            position function

  //               function cryptge
  // String cryptage(String ch) {
  //   int nb = indexLeter(T, ch);
  //   c = nb * A + B;
  // }

  late TabController _tabcontroller = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Affine Cifer Cryptography'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'You can choose both crypt or decrypt your message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              color: Colors.black38,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.amber,
                labelColor: Colors.white,
                controller: _tabcontroller,
                isScrollable: true,
                tabs: const [
                  const Tab(
                    text: "Encryption",
                  ),
                  const Tab(
                    text: 'Decryption',
                  ),
                ],
              ),
            ),
            // Tab bar view
            Container(
              color: Colors.grey[900],
              padding: EdgeInsets.only(left: 15),
              height: 460,
              child: TabBarView(
                controller: TabController(vsync: this, length: 2),
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Encrypt your message here',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          '${notification}',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 130,
                              child: TextField(
                                controller: _aController,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.amber,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // border: Input,
                                    hintText: "(A) key",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ),
                            Container(
                              width: 130,
                              child: TextField(
                                controller: _bController,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.amber,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // border: Input,
                                    hintText: "(B) key",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: _textController,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.amber,
                            ),
                            decoration: InputDecoration(
                                // border: Input,
                                hintText: "Enter your encryption text",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                          ),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          onPressed: () {
                            double _a = double.parse(_aController.text);
                            double _b = double.parse(_bController.text);
                            String _t = _textController.text;

                            cryptage(String ch) {
                              var nb = indexLeter(T, ch);

                              double c = nb * _a + _b;
                              var mod = c % 26;
                              //double r = c % 26;
                              int r = mod.toInt();

                              if (r >= 0 && r <= 25) {
                                return positionNb(T, r);
                              }
                            }

                            setState(() {
                              List<String> arr = [];
                              _result = arr.join();
                              bool isout = false;

                              bool condition = _a % 2 != 0 &&
                                  _a % 13 != 0 &&
                                  _a > 0 &&
                                  _b > 0;
                              int length = _t.length;

                              arr = [];
                              for (int j = 0; j <= length - 1; j++) {
                                if (_t.codeUnitAt(j) < 65 ||
                                    _t.codeUnitAt(j) > 91) {
                                  isout = true;
                                }
                              }
                              if (_a % 2 == 0 ||
                                  _a % 13 == 0 ||
                                  _a < 0 ||
                                  _b < 0) {
                                notification = 'Enter a and b again...';
                              } else if (isout == true) {
                                notification =
                                    'Enter your crypted message again...';
                              } else if ((_a % 2 != 0 &&
                                      _a % 13 != 0 &&
                                      _a > 0 &&
                                      _b > 0) &&
                                  (isout == false)) {
                                notification = 'Good';
                              }

                              /////////////////////
                              if ((_a % 2 != 0 &&
                                      _a % 13 != 0 &&
                                      _a > 0 &&
                                      _b > 0) &&
                                  (isout == false)) {
                                for (int i = 0; i <= length - 1; i++) {
                                  arr.add(cryptage(_t[i])!);
                                }

                                _result = arr.join();
                              }
                            });
                          },
                          height: 35,
                          minWidth: 70,
                          color: Colors.amber,
                          child: Text('Encrypt'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The encryption of your message is: ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '$_result',
                          style: TextStyle(color: Colors.amber, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Decrypt yor message here',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          dnotification,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 130,
                              child: TextField(
                                controller: _daController,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.amber,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // border: Input,
                                    hintText: "(A) key",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ),
                            Container(
                              width: 130,
                              child: TextField(
                                controller: _dbController,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.amber,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // border: Input,
                                    hintText: "(B) key",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: _dtextController,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Colors.amber,
                            ),
                            decoration: InputDecoration(
                                // border: Input,
                                hintText: "Enter your decryption message",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                          ),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          onPressed: () {
                            double _da = double.parse(_daController.text);
                            double _db = double.parse(_dbController.text);
                            String _dt = _dtextController.text;

                            decryptage(String sh) {
                              int ac = 1;
                              while ((ac * _da) % 26 != 1) {
                                ac = ac + 1;
                              }

                              int nb = indexLeter(T, sh);
                              double r = ac * (nb - _db);
                              if (r < 0) {
                                while (r < 0) {
                                  r = r + 26;
                                }
                              } else {
                                r = r % 26;
                              }
                              int intr = r.toInt();
                              int dmd = intr;
                              if ((dmd >= 0) && (dmd <= 25)) {
                                return positionNb(T, dmd);
                              }
                            }

                            setState(() {
                              List<String> arr = [];
                              _dresult = arr.join();
                              bool disout = false;

                              bool condition = _da % 2 != 0 &&
                                  _da % 13 != 0 &&
                                  _da > 0 &&
                                  _db > 0;
                              int dlength = _dt.length;

                              arr = [];
                              for (int j = 0; j <= dlength - 1; j++) {
                                if (_dt.codeUnitAt(j) < 65 ||
                                    _dt.codeUnitAt(j) > 91) {
                                  disout = true;
                                }
                              }
                              if (_da % 2 == 0 ||
                                  _da % 13 == 0 ||
                                  _da < 0 ||
                                  _db < 0) {
                                dnotification = 'Inter a and b again';
                              } else if (disout == true) {
                                dnotification =
                                    'Enter your crypted message again';
                              } else if ((_da % 2 != 0 &&
                                      _da % 13 != 0 &&
                                      _da > 0 &&
                                      _db > 0) &&
                                  (disout == false)) {
                                dnotification = 'Good';
                              }

                              /////////////////////
                              if ((_da % 2 != 0 &&
                                      _da % 13 != 0 &&
                                      _da > 0 &&
                                      _db > 0) &&
                                  (disout == false)) {
                                for (int i = 0; i <= dlength - 1; i++) {
                                  arr.add(decryptage(_dt[i])!);
                                }

                                _dresult = arr.join();
                              }
                            });
                          },
                          height: 35,
                          minWidth: 70,
                          color: Colors.amber,
                          child: Text('Decrypt'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The decryption of your message is:',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _dresult,
                          style: TextStyle(color: Colors.amber, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
          color: Colors.black,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'Powered by:',
                style: TextStyle(color: Colors.amber, fontSize: 16),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'MOHAMED & ABDALLAH',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          )),
    );
  }
}
