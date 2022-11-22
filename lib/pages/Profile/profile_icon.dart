import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);
  final int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 193, 204, 212),
              spreadRadius: -8,
              blurRadius: 21.0,
              offset: Offset(10, 10),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              blurRadius: 6,
              offset: Offset(-3, -4),
            )
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 30),
            SizedBox(
              height: 44,
              width: 44,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: const [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/Profile_Image.png"),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Iyad Aladely',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Text('cc@gmail.com')
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 17,
                    child: CircleAvatar(
                        backgroundColor: const Color(0xffF9F9F9),
                        child: TextButton(
                          onPressed: () {},
                          child: SvgPicture.asset("assets/icons/bell.svg"),
                        )),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffF24F4F),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            _counter.toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
