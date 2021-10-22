import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class JrlIcon
{
    double width = 100;
    JrlIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        return CustomPaint(
            size: Size(width, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: _JrlCustomPainter(),
        );
    }


}

//Copy this CustomPainter code to the Bottom of the File
class _JrlCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        size = Size(size.height/1.25, size.height);

Path path_0 = Path();
    path_0.moveTo(size.width*-0.1013626,size.height*0.0004579528);
    path_0.arcToPoint(Offset(size.width*-0.1646014,size.height*0.05104882),radius: Radius.elliptical(size.width*0.06324208, size.height*0.05059367),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*-0.1646014,size.height*0.09543937);
    path_0.lineTo(size.width*-0.2931148,size.height*0.09543937);
    path_0.arcToPoint(Offset(size.width*-0.3563646,size.height*0.1460309),radius: Radius.elliptical(size.width*0.06324208, size.height*0.05059367),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*-0.3563646,size.height*0.6416598);
    path_0.arcToPoint(Offset(size.width*-0.2499430,size.height*0.7267975),radius: Radius.elliptical(size.width*0.1064188, size.height*0.08513506),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.4970626,size.height*0.7267975);
    path_0.arcToPoint(Offset(size.width*0.5603020,size.height*0.6762060),radius: Radius.elliptical(size.width*0.06324208, size.height*0.05059367),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.5603020,size.height*0.05104882);
    path_0.arcToPoint(Offset(size.width*0.4970626,size.height*0.0004579528),radius: Radius.elliptical(size.width*0.06324208, size.height*0.05059367),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();
    path_0.moveTo(size.width*-0.1013626,size.height*0.01732157);
    path_0.lineTo(size.width*0.4970626,size.height*0.01732157);
    path_0.arcToPoint(Offset(size.width*0.5392329,size.height*0.05104882),radius: Radius.elliptical(size.width*0.04216139, size.height*0.03372911),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5392329,size.height*0.6762060);
    path_0.arcToPoint(Offset(size.width*0.4970626,size.height*0.7099332),radius: Radius.elliptical(size.width*0.04216139, size.height*0.03372911),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*-0.1863596,size.height*0.7099332);
    path_0.arcToPoint(Offset(size.width*-0.1435218,size.height*0.6416598),radius: Radius.elliptical(size.width*0.1064188, size.height*0.08513506),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*-0.1435218,size.height*0.05104882);
    path_0.arcToPoint(Offset(size.width*-0.1013626,size.height*0.01732157),radius: Radius.elliptical(size.width*0.04216139, size.height*0.03372911),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*-0.2931148,size.height*0.1123030);
    path_0.lineTo(size.width*-0.1646014,size.height*0.1123030);
    path_0.lineTo(size.width*-0.1646014,size.height*0.6416598);
    path_0.arcToPoint(Offset(size.width*-0.3352740,size.height*0.6416598),radius: Radius.elliptical(size.width*0.08533813, size.height*0.06827051),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*-0.3352740,size.height*0.1460309);
    path_0.arcToPoint(Offset(size.width*-0.2931148,size.height*0.1123030),radius: Radius.elliptical(size.width*0.04216139, size.height*0.03372911),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*-0.06075110,size.height*0.1018432);
    path_1.arcToPoint(Offset(size.width*-0.07051673,size.height*0.1102742),radius: Radius.elliptical(size.width*0.01054035, size.height*0.008432278),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*-0.07051673,size.height*0.2980021);
    path_1.arcToPoint(Offset(size.width*-0.05997800,size.height*0.3064331),radius: Radius.elliptical(size.width*0.01054035, size.height*0.008432278),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*0.1771232,size.height*0.3064331);
    path_1.arcToPoint(Offset(size.width*0.1876620,size.height*0.2980021),radius: Radius.elliptical(size.width*0.01054035, size.height*0.008432278),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*0.1876620,size.height*0.1102742);
    path_1.arcToPoint(Offset(size.width*0.1771232,size.height*0.1018432),radius: Radius.elliptical(size.width*0.01054035, size.height*0.008432278),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*-0.05997800,size.height*0.1018432);
    path_1.arcToPoint(Offset(size.width*-0.06075107,size.height*0.1018432),radius: Radius.elliptical(size.width*0.01054035, size.height*0.008432278),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.close();
    path_1.moveTo(size.width*-0.04357987,size.height*0.1187052);
    path_1.arcToPoint(Offset(size.width*-0.04313239,size.height*0.1187052),radius: Radius.elliptical(size.width*0.006324209, size.height*0.005059368),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.lineTo(size.width*0.1602775,size.height*0.1187052);
    path_1.arcToPoint(Offset(size.width*0.1665844,size.height*0.1237508),radius: Radius.elliptical(size.width*0.006324209, size.height*0.005059368),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.lineTo(size.width*0.1665844,size.height*0.2895711);
    path_1.lineTo(size.width*-0.04313232,size.height*0.2895711);
    path_1.arcToPoint(Offset(size.width*-0.04943928,size.height*0.2845255),radius: Radius.elliptical(size.width*0.006324209, size.height*0.005059368),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.lineTo(size.width*-0.04943928,size.height*0.1237508);
    path_1.arcToPoint(Offset(size.width*-0.04357987,size.height*0.1187052),radius: Radius.elliptical(size.width*0.006324209, size.height*0.005059368),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*0.4496666,size.height*0.1125310);
    path_2.lineTo(size.width*0.2691329,size.height*0.1125310);
    path_2.arcToPoint(Offset(size.width*0.2691329,size.height*0.1457222),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.4496666,size.height*0.1457222);
    path_2.arcToPoint(Offset(size.width*0.4496666,size.height*0.1125310),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

Path path_3 = Path();
    path_3.moveTo(size.width*0.4496666,size.height*0.1875395);
    path_3.lineTo(size.width*0.2691329,size.height*0.1875395);
    path_3.arcToPoint(Offset(size.width*0.2691329,size.height*0.2207301),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_3.lineTo(size.width*0.4496666,size.height*0.2207301);
    path_3.arcToPoint(Offset(size.width*0.4496666,size.height*0.1875395),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_3.close();

Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_3,paint_3_fill);

Path path_4 = Path();
    path_4.moveTo(size.width*0.4496666,size.height*0.2957380);
    path_4.lineTo(size.width*0.2691329,size.height*0.2957380);
    path_4.arcToPoint(Offset(size.width*0.2691329,size.height*0.2625468),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.lineTo(size.width*0.4496666,size.height*0.2625468);
    path_4.arcToPoint(Offset(size.width*0.4496666,size.height*0.2957380),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.close();

Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
paint_4_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_4,paint_4_fill);

Path path_5 = Path();
    path_5.moveTo(size.width*-0.05151142,size.height*0.3707465);
    path_5.lineTo(size.width*0.4496666,size.height*0.3707465);
    path_5.arcToPoint(Offset(size.width*0.4496666,size.height*0.3375553),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.lineTo(size.width*-0.05151142,size.height*0.3375553);
    path_5.arcToPoint(Offset(size.width*-0.05151142,size.height*0.3707465),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.close();

Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_5,paint_5_fill);

Path path_6 = Path();
    path_6.moveTo(size.width*-0.05151142,size.height*0.4457543);
    path_6.lineTo(size.width*0.4496666,size.height*0.4457543);
    path_6.arcToPoint(Offset(size.width*0.4496666,size.height*0.4125631),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: false);
    path_6.lineTo(size.width*-0.05151142,size.height*0.4125631);
    path_6.arcToPoint(Offset(size.width*-0.05151142,size.height*0.4457543),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: false);
    path_6.close();

Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_6,paint_6_fill);

Path path_7 = Path();
    path_7.moveTo(size.width*0.1290181,size.height*0.4875717);
    path_7.lineTo(size.width*-0.05151142,size.height*0.4875717);
    path_7.arcToPoint(Offset(size.width*-0.05151142,size.height*0.5207628),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: false);
    path_7.lineTo(size.width*0.1290181,size.height*0.5207628);
    path_7.arcToPoint(Offset(size.width*0.1290181,size.height*0.4875717),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: false);
    path_7.close();

Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_7,paint_7_fill);

Path path_8 = Path();
    path_8.moveTo(size.width*0.1290181,size.height*0.5957707);
    path_8.lineTo(size.width*-0.05151142,size.height*0.5957707);
    path_8.arcToPoint(Offset(size.width*-0.05151142,size.height*0.5625795),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: true);
    path_8.lineTo(size.width*0.1290181,size.height*0.5625795);
    path_8.arcToPoint(Offset(size.width*0.1290181,size.height*0.5957707),radius: Radius.elliptical(size.width*0.02074450, size.height*0.01659560),rotation: 0 ,largeArc: false,clockwise: true);
    path_8.close();

Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_8,paint_8_fill);

Path path_9 = Path();
    path_9.moveTo(size.width*0.1290181,size.height*0.6707792);
    path_9.lineTo(size.width*-0.05151142,size.height*0.6707792);
    path_9.arcToPoint(Offset(size.width*-0.05151142,size.height*0.6375880),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: true);
    path_9.lineTo(size.width*0.1290181,size.height*0.6375880);
    path_9.arcToPoint(Offset(size.width*0.1290181,size.height*0.6707792),radius: Radius.elliptical(size.width*0.02074452, size.height*0.01659561),rotation: 0 ,largeArc: false,clockwise: true);
    path_9.close();

Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
paint_9_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_9,paint_9_fill);

Path path_10 = Path();
    path_10.moveTo(size.width*0.4100087,size.height*0.6312083);
    path_10.cubicTo(size.width*0.3923288,size.height*0.6426575,size.width*0.3690198,size.height*0.6472435,size.width*0.3465523,size.height*0.6436931);
    path_10.cubicTo(size.width*0.3313565,size.height*0.6412951,size.width*0.3180920,size.height*0.6340847,size.width*0.3098848,size.height*0.6237615);
    path_10.cubicTo(size.width*0.3056681,size.height*0.6184504,size.width*0.3022194,size.height*0.6127865,size.width*0.2996029,size.height*0.6068749);
    path_10.lineTo(size.width*0.3709353,size.height*0.6068749);
    path_10.lineTo(size.width*0.3780856,size.height*0.5940291);
    path_10.lineTo(size.width*0.2953134,size.height*0.5940291);
    path_10.cubicTo(size.width*0.2932076,size.height*0.5847786,size.width*0.2930908,size.height*0.5753166,size.width*0.2949677,size.height*0.5660359);
    path_10.lineTo(size.width*0.3709372,size.height*0.5660359);
    path_10.lineTo(size.width*0.3780895,size.height*0.5531901);
    path_10.lineTo(size.width*0.2989059,size.height*0.5531901);
    path_10.cubicTo(size.width*0.3015956,size.height*0.5466942,size.width*0.3052831,size.height*0.5404798,size.width*0.3098867,size.height*0.5346839);
    path_10.cubicTo(size.width*0.3180943,size.height*0.5243604,size.width*0.3313596,size.height*0.5171500,size.width*0.3465562,size.height*0.5147523);
    path_10.cubicTo(size.width*0.3690229,size.height*0.5112023,size.width*0.3923311,size.height*0.5157882,size.width*0.4100106,size.height*0.5272370);
    path_10.cubicTo(size.width*0.4136826,size.height*0.5296101,size.width*0.4192163,size.height*0.5275614,size.width*0.4192192,size.height*0.5238267);
    path_10.lineTo(size.width*0.4192192,size.height*0.5100461);
    path_10.cubicTo(size.width*0.4192191,size.height*0.5068827,size.width*0.4170664,size.height*0.5039606,size.width*0.4135742,size.height*0.5023831);
    path_10.cubicTo(size.width*0.3916209,size.height*0.4924651,size.width*0.3658201,size.height*0.4891598,size.width*0.3409899,size.height*0.4930843);
    path_10.cubicTo(size.width*0.3182057,size.height*0.4966867,size.width*0.2983193,size.height*0.5075016,size.width*0.2860145,size.height*0.5229819);
    path_10.cubicTo(size.width*0.2785875,size.height*0.5323231,size.width*0.2727730,size.height*0.5434293,size.width*0.2693346,size.height*0.5541051);
    path_10.lineTo(size.width*0.2327346,size.height*0.5531899);
    path_10.lineTo(size.width*0.2255842,size.height*0.5660357);
    path_10.lineTo(size.width*0.2665393,size.height*0.5660357);
    path_10.cubicTo(size.width*0.2650557,size.height*0.5753352,size.width*0.2651459,size.height*0.5847480,size.width*0.2668078,size.height*0.5940289);
    path_10.lineTo(size.width*0.2327346,size.height*0.5940289);
    path_10.lineTo(size.width*0.2255842,size.height*0.6068747);
    path_10.lineTo(size.width*0.2701548,size.height*0.6068747);
    path_10.cubicTo(size.width*0.2736219,size.height*0.6169650,size.width*0.2789667,size.height*0.6265983,size.width*0.2860164,size.height*0.6354633);
    path_10.cubicTo(size.width*0.2983212,size.height*0.6509436,size.width*0.3182076,size.height*0.6617586,size.width*0.3409918,size.height*0.6653609);
    path_10.cubicTo(size.width*0.3658214,size.height*0.6692853,size.width*0.3916214,size.height*0.6659782,size.width*0.4135742,size.height*0.6560621);
    path_10.cubicTo(size.width*0.4170666,size.height*0.6544848,size.width*0.4192192,size.height*0.6515626,size.width*0.4192192,size.height*0.6483990);
    path_10.lineTo(size.width*0.4192192,size.height*0.6346183);
    path_10.cubicTo(size.width*0.4192149,size.height*0.6308860,size.width*0.4136844,size.height*0.6288372,size.width*0.4100124,size.height*0.6312079);
    path_10.close();

Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.009510630;
paint_10_stroke.color=Color(0xff000000).withOpacity(1);
canvas.drawPath(path_10,paint_10_stroke);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
