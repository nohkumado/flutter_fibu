import 'dart:ui' as ui;
import 'package:flutter/material.dart';
class LedgerIcon
{
    double width = 100;
    LedgerIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        return CustomPaint(
            size: Size(width, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: _LedgerCustomPainter(),
        );
    }


}

class _LedgerCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        Paint paint_black = Paint()..style=PaintingStyle.stroke;
        canvas.drawRect(Offset(0,0)&size,paint_black);

Path path_0 = Path();
    path_0.moveTo(size.width*0.2450472,size.height*18.01401);
    path_0.arcToPoint(Offset(size.width*0.2225433,size.height*18.03202),radius: Radius.elliptical(size.width*0.02250065, size.height*0.01800052),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.2225433,size.height*18.05298);
    path_0.lineTo(size.width*0.2548583,size.height*18.05298);
    path_0.arcToPoint(Offset(size.width*0.2548583,size.height*18.16655),radius: Radius.elliptical(size.width*0.07098388, size.height*0.05678711),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.2323543,size.height*18.16655);
    path_0.lineTo(size.width*0.2323543,size.height*18.20959);
    path_0.lineTo(size.width*0.2548583,size.height*18.20959);
    path_0.arcToPoint(Offset(size.width*0.2548583,size.height*18.32316),radius: Radius.elliptical(size.width*0.07098390, size.height*0.05678712),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.2323543,size.height*18.32316);
    path_0.lineTo(size.width*0.2323543,size.height*18.36620);
    path_0.lineTo(size.width*0.2548583,size.height*18.36620);
    path_0.arcToPoint(Offset(size.width*0.2548583,size.height*18.47977),radius: Radius.elliptical(size.width*0.07098386, size.height*0.05678709),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.2323543,size.height*18.47977);
    path_0.lineTo(size.width*0.2323543,size.height*18.52280);
    path_0.lineTo(size.width*0.2548583,size.height*18.52280);
    path_0.arcToPoint(Offset(size.width*0.2548583,size.height*18.63634),radius: Radius.elliptical(size.width*0.07098150, size.height*0.05678520),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.2225433,size.height*18.63634);
    path_0.lineTo(size.width*0.2225433,size.height*18.65731);
    path_0.arcToPoint(Offset(size.width*0.2450472,size.height*18.67531),radius: Radius.elliptical(size.width*0.02250065, size.height*0.01800052),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.7794724,size.height*18.67531);
    path_0.arcToPoint(Offset(size.width*0.8019764,size.height*18.65731),radius: Radius.elliptical(size.width*0.02250065, size.height*0.01800052),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.8019764,size.height*18.03202);
    path_0.arcToPoint(Offset(size.width*0.7794724,size.height*18.01401),radius: Radius.elliptical(size.width*0.02250065, size.height*0.01800052),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();
    path_0.moveTo(size.width*0.5287008,size.height*18.09478);
    path_0.lineTo(size.width*0.5910394,size.height*18.09478);
    path_0.lineTo(size.width*0.5910394,size.height*18.12570);
    path_0.arcToPoint(Offset(size.width*0.6483307,size.height*18.19194),radius: Radius.elliptical(size.width*0.08847502, size.height*0.07078002),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5869291,size.height*18.19194);
    path_0.arcToPoint(Offset(size.width*0.5487165,size.height*18.21167),radius: Radius.elliptical(size.width*0.02707667, size.height*0.02166133),rotation: 0 ,largeArc: true,clockwise: false);
    path_0.lineTo(size.width*0.5968110,size.height*18.23215);
    path_0.arcToPoint(Offset(size.width*0.5910630,size.height*18.35946),radius: Radius.elliptical(size.width*0.08847502, size.height*0.07078002),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5910630,size.height*18.39181);
    path_0.lineTo(size.width*0.5287244,size.height*18.39181);
    path_0.lineTo(size.width*0.5287244,size.height*18.36216);
    path_0.arcToPoint(Offset(size.width*0.4669528,size.height*18.29468),radius: Radius.elliptical(size.width*0.08847502, size.height*0.07078002),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5283150,size.height*18.29468);
    path_0.arcToPoint(Offset(size.width*0.5680709,size.height*18.27554),radius: Radius.elliptical(size.width*0.02707667, size.height*0.02166133),rotation: 0 ,largeArc: true,clockwise: false);
    path_0.lineTo(size.width*0.5184252,size.height*18.25448);
    path_0.arcToPoint(Offset(size.width*0.5286850,size.height*18.12570),radius: Radius.elliptical(size.width*0.08847502, size.height*0.07078002),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*0.4288425,size.height*18.45477);
    path_0.lineTo(size.width*0.6823858,size.height*18.45477);
    path_0.arcToPoint(Offset(size.width*0.6823858,size.height*18.47860),radius: Radius.elliptical(size.width*0.01489531, size.height*0.01191625),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4288425,size.height*18.47860);
    path_0.arcToPoint(Offset(size.width*0.4288425,size.height*18.45477),radius: Radius.elliptical(size.width*0.01489531, size.height*0.01191625),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*0.4288425,size.height*18.51535);
    path_0.lineTo(size.width*0.6823858,size.height*18.51535);
    path_0.arcToPoint(Offset(size.width*0.6823858,size.height*18.53918),radius: Radius.elliptical(size.width*0.01489528, size.height*0.01191622),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4288425,size.height*18.53918);
    path_0.arcToPoint(Offset(size.width*0.4288425,size.height*18.51535),radius: Radius.elliptical(size.width*0.01489528, size.height*0.01191622),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*0.4288425,size.height*18.57593);
    path_0.lineTo(size.width*0.6823858,size.height*18.57593);
    path_0.arcToPoint(Offset(size.width*0.6823858,size.height*18.59976),radius: Radius.elliptical(size.width*0.01489531, size.height*0.01191625),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4288425,size.height*18.59976);
    path_0.arcToPoint(Offset(size.width*0.4288425,size.height*18.57593),radius: Radius.elliptical(size.width*0.01489531, size.height*0.01191625),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*0.1887953,size.height*18.60936);
    path_1.lineTo(size.width*0.2548425,size.height*18.60936);
    path_1.arcToPoint(Offset(size.width*0.2548425,size.height*18.54979),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.lineTo(size.width*0.1452362,size.height*18.54979);
    path_1.arcToPoint(Offset(size.width*0.1452362,size.height*18.60936),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*0.1887953,size.height*18.45275);
    path_2.lineTo(size.width*0.2548425,size.height*18.45275);
    path_2.arcToPoint(Offset(size.width*0.2548425,size.height*18.39319),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*0.1452362,size.height*18.39319);
    path_2.arcToPoint(Offset(size.width*0.1452362,size.height*18.45275),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_2,paint_2_fill);

Path path_3 = Path();
    path_3.moveTo(size.width*0.1887953,size.height*18.29615);
    path_3.lineTo(size.width*0.2548425,size.height*18.29615);
    path_3.arcToPoint(Offset(size.width*0.2548425,size.height*18.23658),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_3.lineTo(size.width*0.1452362,size.height*18.23658);
    path_3.arcToPoint(Offset(size.width*0.1452362,size.height*18.29615),radius: Radius.elliptical(size.width*0.03723032, size.height*0.02978426),rotation: 0 ,largeArc: false,clockwise: false);
    path_3.close();

Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
paint_3_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_3,paint_3_fill);

Path path_4 = Path();
    path_4.moveTo(size.width*0.1887953,size.height*18.13955);
    path_4.lineTo(size.width*0.2548425,size.height*18.13955);
    path_4.arcToPoint(Offset(size.width*0.2548425,size.height*18.07998),radius: Radius.elliptical(size.width*0.03723042, size.height*0.02978433),rotation: 0 ,largeArc: false,clockwise: false);
    path_4.lineTo(size.width*0.1452362,size.height*18.07998);
    path_4.arcToPoint(Offset(size.width*0.1452362,size.height*18.13955),radius: Radius.elliptical(size.width*0.03723042, size.height*0.02978433),rotation: 0 ,largeArc: false,clockwise: false);
    path_4.close();

Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
paint_4_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_4,paint_4_fill);

Path path_5 = Path();
    path_5.moveTo(size.width*0.8357323,size.height*18.58455);
    path_5.lineTo(size.width*0.8357323,size.height*18.03201);
    path_5.arcToPoint(Offset(size.width*0.7794803,size.height*17.98701),radius: Radius.elliptical(size.width*0.05625161, size.height*0.04500129),rotation: 0 ,largeArc: false,clockwise: false);
    path_5.lineTo(size.width*0.2059134,size.height*17.98701);
    path_5.arcToPoint(Offset(size.width*0.2591732,size.height*17.94201),radius: Radius.elliptical(size.width*0.1030285, size.height*0.08242277),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.lineTo(size.width*0.7794803,size.height*17.94201);
    path_5.arcToPoint(Offset(size.width*0.8919843,size.height*18.03201),radius: Radius.elliptical(size.width*0.1125032, size.height*0.09000258),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.lineTo(size.width*0.8919843,size.height*18.53249);
    path_5.arcToPoint(Offset(size.width*0.8357323,size.height*18.58455),radius: Radius.elliptical(size.width*0.1030285, size.height*0.08242277),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.close();

Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
paint_5_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_5,paint_5_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
