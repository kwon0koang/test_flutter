import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';

@RoutePage()
class TestCheckImgCorsErrorPage extends StatelessWidget {
  const TestCheckImgCorsErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String testImgUrl2 =
        'https://i.namu.wiki/i/SZeH7xACHSqUCk7pgJL1ynpEbYIIUEnqVe_P5kUq0NhbjdvttoS-3vhmAWWHVjDpGE2W4U_rqec1k81hXXOIxA.webp';
    const String testImgUrl3 =
        'https://upload.wikimedia.org/wikipedia/commons/1/10/%22A_present_for_the_mayor.%22_Washington%2C_D.C.%2C_Nov._17._Mayor_Joseph_K._Carson_of_Portland%2C_Ore._today_presented_a_chair_to_Mayor_Fiorello_La_Guardia%2C_of_New_York_City._Mayor_Carson_presented_LCCN2016872616.jpg';

    return DefaultLayoutWidget(
      title: '',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              testImgUrl2,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Text(error.toString());
              },
            ),
            Image.network(
              testImgUrl3,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Text(error.toString());
              },
            ),
            // const MyNetworkImage(
            //   url: testImgUrl2,
            //   width: 100,
            //   height: 100,
            // ),
            // const MyNetworkImage(
            //   url: testImgUrl3,
            //   width: 100,
            //   height: 100,
            // ),
          ],
        ),
      ),
    );
  }
}

// class MyNetworkImage extends StatelessWidget {
//   const MyNetworkImage({
//     super.key,
//     required this.url,
//     this.width,
//     this.height,
//   });

//   final String url;
//   final double? width;
//   final double? height;

//   @override
//   Widget build(BuildContext context) {
//     // https://github.com/flutter/flutter/issues/41563
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       url,
//       (int _) => ImageElement(
//         src: url,
//       ),
//     );
//     return SizedBox(
//       width: width,
//       height: height,
//       child: HtmlElementView(
//         viewType: url,
//       ),
//     );
//   }
// }
