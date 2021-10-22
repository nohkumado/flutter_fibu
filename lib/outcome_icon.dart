import 'dart:ui' as ui;
import 'package:flutter/material.dart';
class OutcomeIcon
{
    double width = 100;
    OutcomeIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        return CustomPaint(
            size: Size(width, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: _OutcomeCustomPainter(),
        );
    }


}

class _OutcomeCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        Paint paint_black = Paint()..style=PaintingStyle.stroke;
        canvas.drawRect(Offset(0,0)&size,paint_black);

Path path_0 = Path();
    path_0.moveTo(size.width*0.8455698,size.height*18.08933);
    path_0.arcToPoint(Offset(size.width*0.8455698,size.height*18.52799),radius: Radius.elliptical(size.width*0.4487012, size.height*0.3589610),rotation: 0 ,largeArc: true,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.8118450,size.height*18.50716),radius: Radius.elliptical(size.width*0.02131137, size.height*0.01704909),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.8118450,size.height*18.11016),radius: Radius.elliptical(size.width*0.4060785, size.height*0.3248628),rotation: 0 ,largeArc: true,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.8455698,size.height*18.08933),radius: Radius.elliptical(size.width*0.02131137, size.height*0.01704909),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*0.7045562,size.height*18.10877);
    path_1.lineTo(size.width*0.7045562,size.height*18.50856);
    path_1.lineTo(size.width*0.9583376,size.height*18.30865);
    path_1.close();
    path_1.moveTo(size.width*0.7168343,size.height*18.13213);
    path_1.lineTo(size.width*0.9409402,size.height*18.30865);
    path_1.lineTo(size.width*0.7168343,size.height*18.48520);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*0.4759429,size.height*18.10151);
    path_2.arcToPoint(Offset(size.width*0.4253621,size.height*18.10508),radius: Radius.elliptical(size.width*0.2305858, size.height*0.1844687),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.3024995,size.height*18.17315),radius: Radius.elliptical(size.width*0.1886991, size.height*0.1509593),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.2686430,size.height*18.23437),radius: Radius.elliptical(size.width*0.2961601, size.height*0.2369281),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.1918743,size.height*18.23437);
    path_2.lineTo(size.width*0.1678688,size.height*18.27835);
    path_2.lineTo(size.width*0.2586900,size.height*18.27835);
    path_2.arcToPoint(Offset(size.width*0.2595058,size.height*18.32232),radius: Radius.elliptical(size.width*0.2961601, size.height*0.2369281),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.1923434,size.height*18.32232);
    path_2.lineTo(size.width*0.1683175,size.height*18.36630);
    path_2.lineTo(size.width*0.2704174,size.height*18.36630);
    path_2.arcToPoint(Offset(size.width*0.3029686,size.height*18.42405),radius: Radius.elliptical(size.width*0.2961601, size.height*0.2369281),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.4258108,size.height*18.49212),radius: Radius.elliptical(size.width*0.1886991, size.height*0.1509593),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.5863030,size.height*18.47115),radius: Radius.elliptical(size.width*0.2305858, size.height*0.1844687),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.6033537,size.height*18.44756),radius: Radius.elliptical(size.width*0.03399793, size.height*0.02719834),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.6033537,size.height*18.41790);
    path_2.arcToPoint(Offset(size.width*0.5672332,size.height*18.40426),radius: Radius.elliptical(size.width*0.02209784, size.height*0.01767827),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.4415969,size.height*18.42943),radius: Radius.elliptical(size.width*0.1506899, size.height*0.1205519),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.3707225,size.height*18.39020),radius: Radius.elliptical(size.width*0.1088031, size.height*0.08704250),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.3551811,size.height*18.36630),radius: Radius.elliptical(size.width*0.2162642, size.height*0.1730113),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.4977457,size.height*18.36630);
    path_2.lineTo(size.width*0.5218124,size.height*18.32232);
    path_2.lineTo(size.width*0.3399661,size.height*18.32232);
    path_2.arcToPoint(Offset(size.width*0.3391503,size.height*18.27834),radius: Radius.elliptical(size.width*0.2162642, size.height*0.1730113),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.4974602,size.height*18.27834);
    path_2.lineTo(size.width*0.5215473,size.height*18.23437);
    path_2.lineTo(size.width*0.3531416,size.height*18.23437);
    path_2.arcToPoint(Offset(size.width*0.3704166,size.height*18.20699),radius: Radius.elliptical(size.width*0.2162642, size.height*0.1730113),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.4412910,size.height*18.16776),radius: Radius.elliptical(size.width*0.1088031, size.height*0.08704250),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.5669273,size.height*18.19294),radius: Radius.elliptical(size.width*0.1506899, size.height*0.1205519),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.5669273,size.height*18.19294);
    path_2.arcToPoint(Offset(size.width*0.6030681,size.height*18.17930),radius: Radius.elliptical(size.width*0.02209784, size.height*0.01767827),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.6030681,size.height*18.14963);
    path_2.arcToPoint(Offset(size.width*0.5860175,size.height*18.12605),radius: Radius.elliptical(size.width*0.03399793, size.height*0.02719834),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.4761061,size.height*18.10151),radius: Radius.elliptical(size.width*0.2305858, size.height*0.1844687),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.close();
    path_2.moveTo(size.width*0.4757390,size.height*18.11129);
    path_2.arcToPoint(Offset(size.width*0.5797969,size.height*18.13452),radius: Radius.elliptical(size.width*0.2183485, size.height*0.1746788),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.5907085,size.height*18.14963),radius: Radius.elliptical(size.width*0.02176062, size.height*0.01740850),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.5907085,size.height*18.17930);
    path_2.arcToPoint(Offset(size.width*0.5745756,size.height*18.18538),radius: Radius.elliptical(size.width*0.009860535, size.height*0.007888428),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.5745756,size.height*18.18538);
    path_2.arcToPoint(Offset(size.width*0.4387416,size.height*18.15813),radius: Radius.elliptical(size.width*0.1629272, size.height*0.1303418),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.3599333,size.height*18.20179),radius: Radius.elliptical(size.width*0.1210404, size.height*0.09683234),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.3356830,size.height*18.24415),radius: Radius.elliptical(size.width*0.2285015, size.height*0.1828012),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.5026611,size.height*18.24415);
    path_2.lineTo(size.width*0.4893632,size.height*18.26856);
    path_2.lineTo(size.width*0.3284018,size.height*18.26856);
    path_2.arcToPoint(Offset(size.width*0.3292177,size.height*18.33210),radius: Radius.elliptical(size.width*0.2285015, size.height*0.1828012),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.5027630,size.height*18.33210);
    path_2.lineTo(size.width*0.4894244,size.height*18.35651);
    path_2.lineTo(size.width*0.3371311,size.height*18.35651);
    path_2.arcToPoint(Offset(size.width*0.3600353,size.height*18.39536),radius: Radius.elliptical(size.width*0.2285015, size.height*0.1828012),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.4388435,size.height*18.43905),radius: Radius.elliptical(size.width*0.1210404, size.height*0.09683234),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.5746368,size.height*18.41180),radius: Radius.elliptical(size.width*0.1629272, size.height*0.1303418),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.5907697,size.height*18.41789),radius: Radius.elliptical(size.width*0.009860535, size.height*0.007888428),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.5907697,size.height*18.44756);
    path_2.arcToPoint(Offset(size.width*0.5798989,size.height*18.46266),radius: Radius.elliptical(size.width*0.02176062, size.height*0.01740850),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.4278911,size.height*18.48252),radius: Radius.elliptical(size.width*0.2183485, size.height*0.1746788),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.3130440,size.height*18.41885),radius: Radius.elliptical(size.width*0.1764618, size.height*0.1411694),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.2793710,size.height*18.35651),radius: Radius.elliptical(size.width*0.2839228, size.height*0.2271382),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.1866326,size.height*18.35651);
    path_2.lineTo(size.width*0.2000325,size.height*18.33210);
    path_2.lineTo(size.width*0.2730484,size.height*18.33210);
    path_2.arcToPoint(Offset(size.width*0.2722326,size.height*18.26856),radius: Radius.elliptical(size.width*0.2839228, size.height*0.2271382),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.lineTo(size.width*0.1864287,size.height*18.26856);
    path_2.lineTo(size.width*0.1998081,size.height*18.24414);
    path_2.lineTo(size.width*0.2780045,size.height*18.24414);
    path_2.arcToPoint(Offset(size.width*0.3127789,size.height*18.17834),radius: Radius.elliptical(size.width*0.2839228, size.height*0.2271382),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.4276260,size.height*18.11470),radius: Radius.elliptical(size.width*0.1764618, size.height*0.1411694),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.4755758,size.height*18.11129),radius: Radius.elliptical(size.width*0.2183485, size.height*0.1746788),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
