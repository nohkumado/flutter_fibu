import 'package:flutter/material.dart';

class BugIcon
{
    double width = 100;
    BugIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        return CustomPaint(
            size: Size(width, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: _BugCustomPainter(),
        );
    }


}

//Copy this CustomPainter code to the Bottom of the File
class _BugCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        Paint paint_black = Paint()..style=PaintingStyle.stroke;
        canvas.drawRect(Offset(0,0)&size,paint_black);

Path path_0 = Path();
    path_0.moveTo(size.width*0.5670226,size.height*18.19003);
    path_0.arcToPoint(Offset(size.width*0.6080249,size.height*18.09383),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.5512019,size.height*18.04240),radius: Radius.elliptical(size.width*0.2277482, size.height*0.1821985),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.4490441,size.height*18.04240),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.3922212,size.height*18.09383),radius: Radius.elliptical(size.width*0.2277482, size.height*0.1821985),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.4332235,size.height*18.19003),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.5670226,size.height*18.19003),radius: Radius.elliptical(size.width*0.1807440, size.height*0.1445952),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*0.7102374,size.height*18.46080);
    path_1.arcToPoint(Offset(size.width*0.2900086,size.height*18.46080),radius: Radius.elliptical(size.width*0.8121946, size.height*0.6497557),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.arcToPoint(Offset(size.width*0.2822664,size.height*18.38330),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.arcToPoint(Offset(size.width*0.7179874,size.height*18.38330),radius: Radius.elliptical(size.width*1.080757, size.height*0.8646056),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.arcToPoint(Offset(size.width*0.7102452,size.height*18.46080),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*0.7164781,size.height*18.37003);
    path_2.arcToPoint(Offset(size.width*0.6888877,size.height*18.29066),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.3113583,size.height*18.29066),radius: Radius.elliptical(size.width*0.8428680, size.height*0.6742944),rotation: 0 ,largeArc: false,clockwise: true);
    path_2.arcToPoint(Offset(size.width*0.2837680,size.height*18.37003),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.arcToPoint(Offset(size.width*0.7164781,size.height*18.37003),radius: Radius.elliptical(size.width*1.064204, size.height*0.8513631),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

Path path_3 = Path();
    path_3.moveTo(size.width*0.6298203,size.height*18.58501);
    path_3.arcToPoint(Offset(size.width*0.5128820,size.height*18.67213),radius: Radius.elliptical(size.width*0.5661591, size.height*0.4529273),rotation: 0 ,largeArc: false,clockwise: true);
    path_3.arcToPoint(Offset(size.width*0.4873641,size.height*18.67213),radius: Radius.elliptical(size.width*0.02235242, size.height*0.01788194),rotation: 0 ,largeArc: false,clockwise: true);
    path_3.arcToPoint(Offset(size.width*0.3704257,size.height*18.58501),radius: Radius.elliptical(size.width*0.5661591, size.height*0.4529273),rotation: 0 ,largeArc: false,clockwise: true);
    path_3.arcToPoint(Offset(size.width*0.6298203,size.height*18.58501),radius: Radius.elliptical(size.width*0.6127258, size.height*0.4901806),rotation: 0 ,largeArc: false,clockwise: false);
    path_3.close();

Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_3,paint_3_fill);

Path path_4 = Path();
    path_4.moveTo(size.width*0.2948260,size.height*18.47549);
    path_4.arcToPoint(Offset(size.width*0.7054201,size.height*18.47549),radius: Radius.elliptical(size.width*0.8287479, size.height*0.6629983),rotation: 0 ,largeArc: false,clockwise: false);
    path_4.arcToPoint(Offset(size.width*0.6714248,size.height*18.53793),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.arcToPoint(Offset(size.width*0.6457505,size.height*18.56842),radius: Radius.elliptical(size.width*0.5661591, size.height*0.4529273),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.arcToPoint(Offset(size.width*0.3544956,size.height*18.56842),radius: Radius.elliptical(size.width*0.5961727, size.height*0.4769381),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.arcToPoint(Offset(size.width*0.3288212,size.height*18.53793),radius: Radius.elliptical(size.width*0.5661591, size.height*0.4529273),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.arcToPoint(Offset(size.width*0.2948260,size.height*18.47549),radius: Radius.elliptical(size.width*0.3334904, size.height*0.2667923),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.close();

Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
paint_4_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_4,paint_4_fill);

Path path_5 = Path();
    path_5.moveTo(size.width*0.4278587,size.height*18.20257);
    path_5.arcToPoint(Offset(size.width*0.3188581,size.height*18.27845),radius: Radius.elliptical(size.width*0.2061264, size.height*0.1649012),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.arcToPoint(Offset(size.width*0.6813333,size.height*18.27845),radius: Radius.elliptical(size.width*0.8263148, size.height*0.6610518),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.arcToPoint(Offset(size.width*0.5723874,size.height*18.20257),radius: Radius.elliptical(size.width*0.2061264, size.height*0.1649012),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.arcToPoint(Offset(size.width*0.4278587,size.height*18.20257),radius: Radius.elliptical(size.width*0.1972972, size.height*0.1578378),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.close();

Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_5,paint_5_fill);

Path path_6 = Path();
    path_6.moveTo(size.width*0.8421753,size.height*18.28201);
    path_6.lineTo(size.width*0.8970353,size.height*18.32369);
    path_6.arcToPoint(Offset(size.width*0.9084218,size.height*18.31409),radius: Radius.elliptical(size.width*0.008276582, size.height*0.006621266),rotation: 0 ,largeArc: false,clockwise: false);
    path_6.lineTo(size.width*0.8535617,size.height*18.27241);
    path_6.arcToPoint(Offset(size.width*0.8067567,size.height*18.25238),radius: Radius.elliptical(size.width*0.1001636, size.height*0.08013087),rotation: 0 ,largeArc: false,clockwise: false);
    path_6.lineTo(size.width*0.6476117,size.height*18.22355);
    path_6.lineTo(size.width*0.6691256,size.height*18.24103);
    path_6.lineTo(size.width*0.8030889,size.height*18.26530);
    path_6.arcToPoint(Offset(size.width*0.8421753,size.height*18.28201),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: true);
    path_6.close();

Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_6,paint_6_fill);

Path path_7 = Path();
    path_7.moveTo(size.width*0.6356778,size.height*18.13645);
    path_7.lineTo(size.width*0.7158759,size.height*18.10585);
    path_7.arcToPoint(Offset(size.width*0.7555175,size.height*18.05564),radius: Radius.elliptical(size.width*0.06953459, size.height*0.05562767),rotation: 0 ,largeArc: false,clockwise: false);
    path_7.lineTo(size.width*0.7555175,size.height*18.00796);
    path_7.arcToPoint(Offset(size.width*0.7389774,size.height*18.00796),radius: Radius.elliptical(size.width*0.008276582, size.height*0.006621266),rotation: 0 ,largeArc: false,clockwise: false);
    path_7.lineTo(size.width*0.7389774,size.height*18.05564);
    path_7.arcToPoint(Offset(size.width*0.7087594,size.height*18.09390),radius: Radius.elliptical(size.width*0.05298143, size.height*0.04238514),rotation: 0 ,largeArc: false,clockwise: true);
    path_7.lineTo(size.width*0.6359515,size.height*18.12168);
    path_7.close();

Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_7,paint_7_fill);

Path path_8 = Path();
    path_8.moveTo(size.width*0.5268414,size.height*18.00724);
    path_8.arcToPoint(Offset(size.width*0.4734047,size.height*18.00724),radius: Radius.elliptical(size.width*0.04138291, size.height*0.03310633),rotation: 0 ,largeArc: false,clockwise: true);
    path_8.lineTo(size.width*0.3940277,size.height*17.95351);
    path_8.arcToPoint(Offset(size.width*0.4047025,size.height*17.94340),radius: Radius.elliptical(size.width*0.008276582, size.height*0.006621266),rotation: 0 ,largeArc: false,clockwise: true);
    path_8.lineTo(size.width*0.4867619,size.height*17.99894);
    path_8.arcToPoint(Offset(size.width*0.5134842,size.height*17.99894),radius: Radius.elliptical(size.width*0.02069146, size.height*0.01655317),rotation: 0 ,largeArc: false,clockwise: false);
    path_8.lineTo(size.width*0.5955435,size.height*17.94340);
    path_8.arcToPoint(Offset(size.width*0.6062184,size.height*17.95351),radius: Radius.elliptical(size.width*0.008276582, size.height*0.006621266),rotation: 0 ,largeArc: false,clockwise: true);
    path_8.close();

Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_8,paint_8_fill);

Path path_9 = Path();
    path_9.moveTo(size.width*0.9314138,size.height*18.59164);
    path_9.lineTo(size.width*0.9161406,size.height*18.58659);
    path_9.arcToPoint(Offset(size.width*0.9022906,size.height*18.57006),radius: Radius.elliptical(size.width*0.02235242, size.height*0.01788194),rotation: 0 ,largeArc: false,clockwise: true);
    path_9.lineTo(size.width*0.9022906,size.height*18.48849);
    path_9.arcToPoint(Offset(size.width*0.8684518,size.height*18.42845),radius: Radius.elliptical(size.width*0.1001636, size.height*0.08013087),rotation: 0 ,largeArc: false,clockwise: false);
    path_9.lineTo(size.width*0.7221166,size.height*18.32497);
    path_9.lineTo(size.width*0.7287639,size.height*18.34735);
    path_9.lineTo(size.width*0.8574720,size.height*18.43837);
    path_9.arcToPoint(Offset(size.width*0.8857270,size.height*18.48849),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: true);
    path_9.lineTo(size.width*0.8857270,size.height*18.57006);
    path_9.arcToPoint(Offset(size.width*0.9097591,size.height*18.59883),radius: Radius.elliptical(size.width*0.03890559, size.height*0.03112447),rotation: 0 ,largeArc: false,clockwise: false);
    path_9.lineTo(size.width*0.9250871,size.height*18.60388);
    path_9.arcToPoint(Offset(size.width*0.9313430,size.height*18.59164),radius: Radius.elliptical(size.width*0.008276583, size.height*0.006621267),rotation: 0 ,largeArc: false,clockwise: false);
    path_9.close();

Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
paint_9_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_9,paint_9_fill);

Path path_10 = Path();
    path_10.moveTo(size.width*0.1934894,size.height*18.25238);
    path_10.lineTo(size.width*0.3526343,size.height*18.22355);
    path_10.lineTo(size.width*0.3310657,size.height*18.24103);
    path_10.lineTo(size.width*0.1971571,size.height*18.26530);
    path_10.arcToPoint(Offset(size.width*0.1580708,size.height*18.28201),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: false);
    path_10.lineTo(size.width*0.1032107,size.height*18.32369);
    path_10.arcToPoint(Offset(size.width*0.09176952,size.height*18.31409),radius: Radius.elliptical(size.width*0.008293031, size.height*0.006634425),rotation: 0 ,largeArc: false,clockwise: true);
    path_10.lineTo(size.width*0.1466843,size.height*18.27241);
    path_10.arcToPoint(Offset(size.width*0.1934894,size.height*18.25238),radius: Radius.elliptical(size.width*0.1001636, size.height*0.08013087),rotation: 0 ,largeArc: false,clockwise: true);
    path_10.close();

Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
paint_10_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_10,paint_10_fill);

Path path_11 = Path();
    path_11.moveTo(size.width*0.3642945,size.height*18.12168);
    path_11.lineTo(size.width*0.3642945,size.height*18.13645);
    path_11.lineTo(size.width*0.2840417,size.height*18.10585);
    path_11.arcToPoint(Offset(size.width*0.2444549,size.height*18.05564),radius: Radius.elliptical(size.width*0.06953459, size.height*0.05562767),rotation: 0 ,largeArc: false,clockwise: true);
    path_11.lineTo(size.width*0.2444549,size.height*18.00796);
    path_11.arcToPoint(Offset(size.width*0.2609950,size.height*18.00796),radius: Radius.elliptical(size.width*0.008276582, size.height*0.006621266),rotation: 0 ,largeArc: false,clockwise: true);
    path_11.lineTo(size.width*0.2609950,size.height*18.05564);
    path_11.arcToPoint(Offset(size.width*0.2912130,size.height*18.09390),radius: Radius.elliptical(size.width*0.05298143, size.height*0.04238514),rotation: 0 ,largeArc: false,clockwise: false);
    path_11.close();

Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
paint_11_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_11,paint_11_fill);

Path path_12 = Path();
    path_12.moveTo(size.width*0.06877756,size.height*18.59164);
    path_12.lineTo(size.width*0.08410554,size.height*18.58659);
    path_12.arcToPoint(Offset(size.width*0.09790070,size.height*18.57006),radius: Radius.elliptical(size.width*0.02235242, size.height*0.01788194),rotation: 0 ,largeArc: false,clockwise: false);
    path_12.lineTo(size.width*0.09790070,size.height*18.48849);
    path_12.arcToPoint(Offset(size.width*0.1317395,size.height*18.42845),radius: Radius.elliptical(size.width*0.1001636, size.height*0.08013087),rotation: 0 ,largeArc: false,clockwise: true);
    path_12.lineTo(size.width*0.2781295,size.height*18.32497);
    path_12.lineTo(size.width*0.2714821,size.height*18.34735);
    path_12.lineTo(size.width*0.1427741,size.height*18.43837);
    path_12.arcToPoint(Offset(size.width*0.1145190,size.height*18.48849),radius: Radius.elliptical(size.width*0.08361043, size.height*0.06688834),rotation: 0 ,largeArc: false,clockwise: false);
    path_12.lineTo(size.width*0.1145190,size.height*18.57006);
    path_12.arcToPoint(Offset(size.width*0.09043224,size.height*18.59883),radius: Radius.elliptical(size.width*0.03890559, size.height*0.03112447),rotation: 0 ,largeArc: false,clockwise: true);
    path_12.lineTo(size.width*0.07515901,size.height*18.60388);
    path_12.arcToPoint(Offset(size.width*0.06882449,size.height*18.59164),radius: Radius.elliptical(size.width*0.008282762, size.height*0.006626210),rotation: 0 ,largeArc: false,clockwise: true);
    path_12.close();

Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
paint_12_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_12,paint_12_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
