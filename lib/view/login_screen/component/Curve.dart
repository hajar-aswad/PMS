import 'package:flutter/material.dart';



class WaveClipper extends CustomClipper<Path> {
 @override
  Path getClip(Size size) {
    final path = Path();
   double controlPointX1 = 0;
    double controlPointY1 = size.height * 0.9; // Shifted downward

    double endPointX1 = size.width / 2;
    double endPointY1 = size.height * 0.7; // Shifted downward

    double controlPointX2 = size.width;
    double controlPointY2 = size.height * 0.5; // Shifted downward

    double endPointX2 = size.width;
    double endPointY2 = size.height * 0.3; // Shifted downward

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        controlPointX1, controlPointY1, endPointX1, endPointY1);
    path.quadraticBezierTo(
        controlPointX2, controlPointY2, endPointX2, endPointY2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
 
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


// class WaveClipper extends CustomClipper<Path> {
//  @override
//   Path getClip(Size size) {
//     final path = Path();
//    double controlPointX1 = 0;
//     double controlPointY1 = size.height * 0.9; // Shifted downward

//     double endPointX1 = size.width / 2;
//     double endPointY1 = size.height * 0.7; // Shifted downward

//     double controlPointX2 = size.width;
//     double controlPointY2 = size.height * 0.5; // Shifted downward

//     double endPointX2 = size.width;
//     double endPointY2 = size.height * 0.3; // Shifted downward

//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         controlPointX1, controlPointY1, endPointX1, endPointY1);
//     path.quadraticBezierTo(
//         controlPointX2, controlPointY2, endPointX2, endPointY2);
//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }
 
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
class curve extends StatelessWidget {
  const curve({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height /2,
            color: Colors.blue,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://media.istockphoto.com/id/1036131880/photo/efficient-pharmacy-operations-thanks-to-teamwork.jpg?s=612x612&w=0&k=20&c=JQPtkW7j14dvFWeLd6JlltULHMw07rJdi5ey7QLqCHc=', // Replace with your own image URLs
                    fit: BoxFit.cover,
                  ),
                ),
                // Container(
                //   color: Colors.blue.withOpacity(0.5),
                // ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70,)
                     , Row(
                       children: [
                          const Text(
                            'PHARMACY',
                            style: TextStyle(
                              color: Color.fromARGB(255, 240, 208, 112),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         const Text(
                            '.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                       ],
                     ),
                      const SizedBox(height: 4),
                      const Text(
                        'Welcome Back !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3 + 60,
          left: 20,
          right: 20,
          child: Column(
          ),
        ),
      ],
    );
  }
}


