// ignore_for_file: unused_import

import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class DownloadIcon
{
    double width = 100;
    DownloadIcon({width}){if(width != 0) this.width = width*1.0;}
    Widget draw() {
        return CustomPaint(
            size: Size(width, (width*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: _DownloadCustomPainter(),
        );
    }


}

//Copy this CustomPainter code to the Bottom of the File
class _DownloadCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
        Paint paint_black = Paint()..style=PaintingStyle.stroke;
        canvas.drawRect(Offset(0,0)&size,paint_black);

Path path_0 = Path();
    path_0.moveTo(size.width*0.4869085,size.height*17.94214);
    path_0.arcToPoint(Offset(size.width*0.04224418,size.height*18.30842),radius: Radius.elliptical(size.width*0.4577548, size.height*0.3662039),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.9577522,size.height*18.30842),radius: Radius.elliptical(size.width*0.4577548, size.height*0.3662039),rotation: 0 ,largeArc: true,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.4869085,size.height*17.94214),radius: Radius.elliptical(size.width*0.4577548, size.height*0.3662039),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();
    path_0.moveTo(size.width*0.4307514,size.height*18.03846);
    path_0.lineTo(size.width*0.5692607,size.height*18.03846);
    path_0.arcToPoint(Offset(size.width*0.5739005,size.height*18.04222),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5739005,size.height*18.08393);
    path_0.lineTo(size.width*0.4260251,size.height*18.08393);
    path_0.lineTo(size.width*0.4260251,size.height*18.04222);
    path_0.arcToPoint(Offset(size.width*0.4307435,size.height*18.03846),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*0.4260329,size.height*18.10274);
    path_0.lineTo(size.width*0.5739084,size.height*18.10274);
    path_0.lineTo(size.width*0.5739084,size.height*18.14687);
    path_0.lineTo(size.width*0.4260329,size.height*18.14687);
    path_0.close();
    path_0.moveTo(size.width*0.4260329,size.height*18.16569);
    path_0.lineTo(size.width*0.5739084,size.height*18.16569);
    path_0.lineTo(size.width*0.5739084,size.height*18.27853);
    path_0.arcToPoint(Offset(size.width*0.5786268,size.height*18.28230),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.7019979,size.height*18.28230);
    path_0.arcToPoint(Offset(size.width*0.7053794,size.height*18.28874),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.5033444,size.height*18.45039);
    path_0.arcToPoint(Offset(size.width*0.4966600,size.height*18.45039),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.2946249,size.height*18.28874);
    path_0.arcToPoint(Offset(size.width*0.2979278,size.height*18.28230),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4213539,size.height*18.28230);
    path_0.arcToPoint(Offset(size.width*0.4260724,size.height*18.27853),radius: Radius.elliptical(size.width*0.004711340, size.height*0.003769072),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();
    path_0.moveTo(size.width*0.2449713,size.height*18.49070);
    path_0.lineTo(size.width*0.7549622,size.height*18.49070);
    path_0.lineTo(size.width*0.7549622,size.height*18.51891);
    path_0.lineTo(size.width*0.2449713,size.height*18.51891);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
