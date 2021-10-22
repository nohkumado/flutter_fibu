import 'package:flutter/material.dart';
class KplIcon
{
    double width = 100;
    KplIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        Size size = Size(width, (width*1.25).toDouble());
        print("painting iwt width $width $size");
        return CustomPaint(
            size: size,
            painter: _KplCustomPainter(),
        );
    }
}

class _KplCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        Path path_0 = Path();
        path_0.moveTo(size.width*0.2497446,size.height*17.99059);
        path_0.arcToPoint(Offset(size.width*0.1981613,size.height*18.03187),radius: Radius.elliptical(size.width*0.05160108, size.height*0.04128087),rotation: 0 ,largeArc: false,clockwise: false);
        path_0.lineTo(size.width*0.1981613,size.height*18.06810);
        path_0.lineTo(size.width*0.09334876,size.height*18.06810);
        path_0.arcToPoint(Offset(size.width*0.04166125,size.height*18.10937),radius: Radius.elliptical(size.width*0.05160108, size.height*0.04128087),rotation: 0 ,largeArc: false,clockwise: false);
        path_0.lineTo(size.width*0.04166125,size.height*18.51377);
        path_0.arcToPoint(Offset(size.width*0.1285363,size.height*18.58323),radius: Radius.elliptical(size.width*0.08683027, size.height*0.06946421),rotation: 0 ,largeArc: false,clockwise: false);
        path_0.lineTo(size.width*0.6558904,size.height*18.58323);
        path_0.lineTo(size.width*0.6558904,size.height*18.56950);
        path_0.lineTo(size.width*0.1804113,size.height*18.56950);
        path_0.arcToPoint(Offset(size.width*0.2153696,size.height*18.51377),radius: Radius.elliptical(size.width*0.08683027, size.height*0.06946421),rotation: 0 ,largeArc: false,clockwise: false);
        path_0.lineTo(size.width*0.2153696,size.height*18.03187);
        path_0.arcToPoint(Offset(size.width*0.2497446,size.height*18.00436),radius: Radius.elliptical(size.width*0.03440072, size.height*0.02752058),rotation: 0 ,largeArc: false,clockwise: true);
        path_0.lineTo(size.width*0.7380362,size.height*18.00436);
        path_0.arcToPoint(Offset(size.width*0.7724112,size.height*18.03187),radius: Radius.elliptical(size.width*0.03440072, size.height*0.02752058),rotation: 0 ,largeArc: false,clockwise: true);
        path_0.lineTo(size.width*0.7724112,size.height*18.34437);
        path_0.lineTo(size.width*0.7896196,size.height*18.34437);
        path_0.lineTo(size.width*0.7896196,size.height*18.03187);
        path_0.arcToPoint(Offset(size.width*0.7380362,size.height*17.99059),radius: Radius.elliptical(size.width*0.05160108, size.height*0.04128087),rotation: 0 ,largeArc: false,clockwise: false);
        path_0.close();
        path_0.moveTo(size.width*0.09334876,size.height*18.08187);
        path_0.lineTo(size.width*0.1981613,size.height*18.08187);
        path_0.lineTo(size.width*0.1981613,size.height*18.51377);
        path_0.arcToPoint(Offset(size.width*0.05886959,size.height*18.51377),radius: Radius.elliptical(size.width*0.06964961, size.height*0.05571968),rotation: 0 ,largeArc: false,clockwise: true);
        path_0.lineTo(size.width*0.05886959,size.height*18.10937);
        path_0.arcToPoint(Offset(size.width*0.09334876,size.height*18.08187),radius: Radius.elliptical(size.width*0.03440072, size.height*0.02752058),rotation: 0 ,largeArc: false,clockwise: true);
        path_0.close();

        Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
        paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
        Paint paint_black = Paint()..style=PaintingStyle.stroke;
        canvas.drawRect(Offset(0,0)&size,paint_black);
        canvas.drawPath(path_0,paint_0_fill);

        Path path_1 = Path();
        path_1.moveTo(size.width*0.7820630,size.height*18.50869);
        path_1.arcToPoint(Offset(size.width*0.7720315,size.height*18.52271),radius: Radius.elliptical(size.width*0.02032010, size.height*0.01625608),rotation: 0 ,largeArc: false,clockwise: false);
        path_1.lineTo(size.width*0.7720315,size.height*18.52582);
        path_1.arcToPoint(Offset(size.width*0.6959134,size.height*18.51482),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_1.lineTo(size.width*0.6959134,size.height*18.49754);
        path_1.arcToPoint(Offset(size.width*0.7820630,size.height*18.50869),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_1.close();

        Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
        paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_1,paint_1_fill);

        Path path_2 = Path();
        path_2.moveTo(size.width*0.8639764,size.height*18.40922);
        path_2.arcToPoint(Offset(size.width*0.8647638,size.height*18.39603),radius: Radius.elliptical(size.width*0.008762129, size.height*0.007009703),rotation: 0 ,largeArc: false,clockwise: false);
        path_2.arcToPoint(Offset(size.width*0.7002835,size.height*18.39603),radius: Radius.elliptical(size.width*0.2188449, size.height*0.1750760),rotation: 0 ,largeArc: false,clockwise: false);
        path_2.arcToPoint(Offset(size.width*0.7010709,size.height*18.40922),radius: Radius.elliptical(size.width*0.008762129, size.height*0.007009703),rotation: 0 ,largeArc: false,clockwise: false);
        path_2.arcToPoint(Offset(size.width*0.8641181,size.height*18.40922),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_2.close();

        Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
        paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_2,paint_2_fill);

        Path path_3 = Path();
        path_3.moveTo(size.width*0.6959134,size.height*18.43475);
        path_3.lineTo(size.width*0.6959134,size.height*18.41747);
        path_3.arcToPoint(Offset(size.width*0.8706457,size.height*18.41702),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_3.lineTo(size.width*0.8706457,size.height*18.43431);
        path_3.arcToPoint(Offset(size.width*0.6959134,size.height*18.43475),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_3.close();

        Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
        paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_3,paint_3_fill);

        Path path_4 = Path();
        path_4.moveTo(size.width*0.6959134,size.height*18.46144);
        path_4.lineTo(size.width*0.6959134,size.height*18.44416);
        path_4.arcToPoint(Offset(size.width*0.8706457,size.height*18.44372),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_4.lineTo(size.width*0.8706457,size.height*18.46100);
        path_4.arcToPoint(Offset(size.width*0.6959134,size.height*18.46144),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_4.close();

        Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
        paint_4_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_4,paint_4_fill);

        Path path_5 = Path();
        path_5.moveTo(size.width*0.6959134,size.height*18.47085);
        path_5.lineTo(size.width*0.6959134,size.height*18.48814);
        path_5.arcToPoint(Offset(size.width*0.8706457,size.height*18.48769),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_5.lineTo(size.width*0.8706457,size.height*18.47041);
        path_5.arcToPoint(Offset(size.width*0.6959134,size.height*18.47085),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_5.close();

        Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
        paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_5,paint_5_fill);

        Path path_6 = Path();
        path_6.moveTo(size.width*0.7720315,size.height*18.55252);
        path_6.lineTo(size.width*0.7720315,size.height*18.53523);
        path_6.arcToPoint(Offset(size.width*0.6959134,size.height*18.52423),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_6.lineTo(size.width*0.6959134,size.height*18.54152);
        path_6.arcToPoint(Offset(size.width*0.7720315,size.height*18.55252),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_6.close();

        Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
        paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_6,paint_6_fill);

        Path path_7 = Path();
        path_7.moveTo(size.width*0.6959134,size.height*18.55092);
        path_7.lineTo(size.width*0.6959134,size.height*18.56344);
        path_7.arcToPoint(Offset(size.width*0.7109055,size.height*18.57906),radius: Radius.elliptical(size.width*0.02022030, size.height*0.01617624),rotation: 0 ,largeArc: false,clockwise: false);
        path_7.arcToPoint(Offset(size.width*0.7720315,size.height*18.58647),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_7.lineTo(size.width*0.7720315,size.height*18.56192);
        path_7.arcToPoint(Offset(size.width*0.6959134,size.height*18.55092),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_7.close();

        Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
        paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_7,paint_7_fill);

        Path path_8 = Path();
        path_8.moveTo(size.width*0.9583465,size.height*18.55449);
        path_8.lineTo(size.width*0.9583465,size.height*18.53720);
        path_8.arcToPoint(Offset(size.width*0.7836063,size.height*18.53764),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_8.lineTo(size.width*0.7836063,size.height*18.55493);
        path_8.arcToPoint(Offset(size.width*0.9583465,size.height*18.55449),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_8.close();

        Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
        paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_8,paint_8_fill);

        Path path_9 = Path();
        path_9.moveTo(size.width*0.9583465,size.height*18.56389);
        path_9.lineTo(size.width*0.9583465,size.height*18.58118);
        path_9.arcToPoint(Offset(size.width*0.7836063,size.height*18.58162),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_9.lineTo(size.width*0.7836063,size.height*18.56433);
        path_9.arcToPoint(Offset(size.width*0.9583465,size.height*18.56389),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_9.close();

        Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
        paint_9_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_9,paint_9_fill);

        Path path_10 = Path();
        path_10.moveTo(size.width*0.9435118,size.height*18.61877);
        path_10.arcToPoint(Offset(size.width*0.9583465,size.height*18.60318),radius: Radius.elliptical(size.width*0.02022030, size.height*0.01617624),rotation: 0 ,largeArc: false,clockwise: false);
        path_10.lineTo(size.width*0.9583465,size.height*18.59058);
        path_10.arcToPoint(Offset(size.width*0.7836063,size.height*18.59102),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: true);
        path_10.lineTo(size.width*0.7836063,size.height*18.60354);
        path_10.arcToPoint(Offset(size.width*0.7985984,size.height*18.61916),radius: Radius.elliptical(size.width*0.02022030, size.height*0.01617624),rotation: 0 ,largeArc: false,clockwise: false);
        path_10.arcToPoint(Offset(size.width*0.9435118,size.height*18.61878),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_10.close();

        Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
        paint_10_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_10,paint_10_fill);

        Path path_11 = Path();
        path_11.moveTo(size.width*0.9516772,size.height*18.52941);
        path_11.arcToPoint(Offset(size.width*0.9524646,size.height*18.51621),radius: Radius.elliptical(size.width*0.008762129, size.height*0.007009703),rotation: 0 ,largeArc: false,clockwise: false);
        path_11.arcToPoint(Offset(size.width*0.7879764,size.height*18.51621),radius: Radius.elliptical(size.width*0.2188449, size.height*0.1750760),rotation: 0 ,largeArc: false,clockwise: false);
        path_11.arcToPoint(Offset(size.width*0.7887638,size.height*18.52941),radius: Radius.elliptical(size.width*0.008762129, size.height*0.007009703),rotation: 0 ,largeArc: false,clockwise: false);
        path_11.arcToPoint(Offset(size.width*0.9518189,size.height*18.52941),radius: Radius.elliptical(size.width*0.2755217, size.height*0.2204173),rotation: 0 ,largeArc: false,clockwise: false);
        path_11.close();

        Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
        paint_11_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_11,paint_11_fill);

        Path path_12 = Path();
        path_12.moveTo(size.width*0.3332126,size.height*18.15021);
        path_12.lineTo(size.width*0.3633622,size.height*18.15021);
        path_12.lineTo(size.width*0.3633622,size.height*18.24282);
        path_12.lineTo(size.width*0.3332126,size.height*18.24282);
        path_12.close();

        Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
        paint_12_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_12,paint_12_fill);

        Path path_13 = Path();
        path_13.moveTo(size.width*0.4330315,size.height*18.11388);
        path_13.lineTo(size.width*0.4330315,size.height*18.24282);
        path_13.lineTo(size.width*0.4029370,size.height*18.24282);
        path_13.lineTo(size.width*0.4029370,size.height*18.11388);
        path_13.close();

        Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
        paint_13_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_13,paint_13_fill);

        Path path_14 = Path();
        path_14.moveTo(size.width*0.5027087,size.height*18.17769);
        path_14.lineTo(size.width*0.5027087,size.height*18.24282);
        path_14.lineTo(size.width*0.4726142,size.height*18.24282);
        path_14.lineTo(size.width*0.4726142,size.height*18.17769);
        path_14.close();

        Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
        paint_14_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_14,paint_14_fill);

        Path path_15 = Path();
        path_15.moveTo(size.width*0.5724409,size.height*18.24282);
        path_15.lineTo(size.width*0.5422835,size.height*18.24282);
        path_15.lineTo(size.width*0.5422835,size.height*18.12833);
        path_15.lineTo(size.width*0.5724409,size.height*18.12833);
        path_15.close();

        Paint paint_15_fill = Paint()..style=PaintingStyle.fill;
        paint_15_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_15,paint_15_fill);

        Path path_16 = Path();
        path_16.moveTo(size.width*0.4324803,size.height*18.08821);
        path_16.lineTo(size.width*0.4669370,size.height*18.13181);
        path_16.arcToPoint(Offset(size.width*0.5188583,size.height*18.13345),radius: Radius.elliptical(size.width*0.03156122, size.height*0.02524897),rotation: 0 ,largeArc: false,clockwise: false);
        path_16.lineTo(size.width*0.5698504,size.height*18.07893);
        path_16.lineTo(size.width*0.5774882,size.height*18.08346);
        path_16.lineTo(size.width*0.5785906,size.height*18.05913);
        path_16.lineTo(size.width*0.5497008,size.height*18.06683);
        path_16.lineTo(size.width*0.5572598,size.height*18.07136);
        path_16.lineTo(size.width*0.5062756,size.height*18.12589);
        path_16.arcToPoint(Offset(size.width*0.4803150,size.height*18.12506),radius: Radius.elliptical(size.width*0.01578060, size.height*0.01262448),rotation: 0 ,largeArc: false,clockwise: true);
        path_16.lineTo(size.width*0.4458583,size.height*18.08146);
        path_16.arcToPoint(Offset(size.width*0.3949291,size.height*18.07881),radius: Radius.elliptical(size.width*0.03156122, size.height*0.02524897),rotation: 0 ,largeArc: false,clockwise: false);
        path_16.lineTo(size.width*0.3505039,size.height*18.12156);
        path_16.lineTo(size.width*0.3626299,size.height*18.12962);
        path_16.lineTo(size.width*0.4070551,size.height*18.08688);
        path_16.arcToPoint(Offset(size.width*0.4325197,size.height*18.08821),radius: Radius.elliptical(size.width*0.01578060, size.height*0.01262448),rotation: 0 ,largeArc: false,clockwise: true);
        path_16.close();

        Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
        paint_16_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_16,paint_16_fill);

        Path path_17 = Path();
        path_17.moveTo(size.width*0.3093386,size.height*18.28626);
        path_17.lineTo(size.width*0.6081575,size.height*18.28626);
        path_17.arcToPoint(Offset(size.width*0.6081575,size.height*18.26940),radius: Radius.elliptical(size.width*0.01053228, size.height*0.008425827),rotation: 0 ,largeArc: false,clockwise: false);
        path_17.lineTo(size.width*0.3093386,size.height*18.26940);
        path_17.arcToPoint(Offset(size.width*0.3093386,size.height*18.28626),radius: Radius.elliptical(size.width*0.01053228, size.height*0.008425827),rotation: 0 ,largeArc: false,clockwise: false);
        path_17.close();

        Paint paint_17_fill = Paint()..style=PaintingStyle.fill;
        paint_17_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_17,paint_17_fill);

        Path path_18 = Path();
        path_18.moveTo(size.width*0.4427402,size.height*18.52446);
        path_18.arcToPoint(Offset(size.width*0.5214488,size.height*18.51419),radius: Radius.elliptical(size.width*0.1130686, size.height*0.09045492),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.5275906,size.height*18.50572),radius: Radius.elliptical(size.width*0.01221052, size.height*0.009768417),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.lineTo(size.width*0.5275906,size.height*18.49049);
        path_18.arcToPoint(Offset(size.width*0.5175591,size.height*18.48673),radius: Radius.elliptical(size.width*0.006105261, size.height*0.004884209),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.4487717,size.height*18.50052),radius: Radius.elliptical(size.width*0.08254234, size.height*0.06603387),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.arcToPoint(Offset(size.width*0.4090236,size.height*18.47850),radius: Radius.elliptical(size.width*0.06105261, size.height*0.04884209),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.arcToPoint(Offset(size.width*0.3978346,size.height*18.45984),radius: Radius.elliptical(size.width*0.1161848, size.height*0.09294784),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.lineTo(size.width*0.4752283,size.height*18.45984);
        path_18.lineTo(size.width*0.4830236,size.height*18.44565);
        path_18.lineTo(size.width*0.3932283,size.height*18.44565);
        path_18.arcToPoint(Offset(size.width*0.3924409,size.height*18.41472),radius: Radius.elliptical(size.width*0.1161848, size.height*0.09294784),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.lineTo(size.width*0.4748504,size.height*18.41472);
        path_18.lineTo(size.width*0.4826457,size.height*18.40052);
        path_18.lineTo(size.width*0.3967638,size.height*18.40052);
        path_18.arcToPoint(Offset(size.width*0.4086693,size.height*18.38008),radius: Radius.elliptical(size.width*0.1161848, size.height*0.09294784),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.arcToPoint(Offset(size.width*0.4484094,size.height*18.35805),radius: Radius.elliptical(size.width*0.06105261, size.height*0.04884209),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.arcToPoint(Offset(size.width*0.5172047,size.height*18.37185),radius: Radius.elliptical(size.width*0.08254234, size.height*0.06603387),rotation: 0 ,largeArc: false,clockwise: true);
        path_18.arcToPoint(Offset(size.width*0.5272362,size.height*18.36808),radius: Radius.elliptical(size.width*0.006105261, size.height*0.004884209),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.lineTo(size.width*0.5272362,size.height*18.35286);
        path_18.arcToPoint(Offset(size.width*0.5210945,size.height*18.34439),radius: Radius.elliptical(size.width*0.01221052, size.height*0.009768417),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.4423780,size.height*18.33411),radius: Radius.elliptical(size.width*0.1130686, size.height*0.09045492),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.3827402,size.height*18.36715),radius: Radius.elliptical(size.width*0.09157892, size.height*0.07326314),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.3649921,size.height*18.40053),radius: Radius.elliptical(size.width*0.1467111, size.height*0.1173689),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.lineTo(size.width*0.3249685,size.height*18.40053);
        path_18.lineTo(size.width*0.3171732,size.height*18.41472);
        path_18.lineTo(size.width*0.3616063,size.height*18.41472);
        path_18.arcToPoint(Offset(size.width*0.3623937,size.height*18.44565),radius: Radius.elliptical(size.width*0.1467111, size.height*0.1173689),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.lineTo(size.width*0.3254094,size.height*18.44565);
        path_18.lineTo(size.width*0.3176142,size.height*18.45984);
        path_18.lineTo(size.width*0.3659528,size.height*18.45984);
        path_18.arcToPoint(Offset(size.width*0.3831496,size.height*18.49143),radius: Radius.elliptical(size.width*0.1467111, size.height*0.1173689),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.arcToPoint(Offset(size.width*0.4427874,size.height*18.52446),radius: Radius.elliptical(size.width*0.09157892, size.height*0.07326314),rotation: 0 ,largeArc: false,clockwise: false);
        path_18.close();

        Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
        paint_18_fill.color = Color(0xff000000).withOpacity(1.0);
        canvas.drawPath(path_18,paint_18_fill);

    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
        return true;
    }
}
