import 'package:flutter/material.dart';

class BilanzIcon
{
  double width = 10;
  BilanzIcon({width}){if(width != 0) this.width = width*1.0;}
  Widget draw() {
    Size size = Size(width, (width*1.3654966157720763).toDouble());
    return CustomPaint(
      painter: _BilanzCustomPainter(),
      size: size,
    );
  }


}

class _BilanzCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    size = Size(size.height/1.3654966157720763, size.height);

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2959232,0);
    path_0.lineTo(size.width,0);
    path_0.lineTo(size.width,size.height*0.6968876);
    path_0.lineTo(size.width*0.7824650,size.height*0.6968876);
    path_0.cubicTo(size.width*0.7985991,size.height*0.6887608,size.width*0.8124508,size.height*0.6784438,size.width*0.8229183,size.height*0.6660519);
    path_0.lineTo(size.width*0.9579726,size.height*0.6660519);
    path_0.lineTo(size.width*0.9579726,size.height*0.03077810);
    path_0.lineTo(size.width*0.3380293,size.height*0.03077810);
    path_0.lineTo(size.width*0.3380293,size.height*0.3675504);
    path_0.lineTo(size.width*0.2959232,size.height*0.3675504);
    path_0.lineTo(size.width*0.2959232,0);
    path_0.close();
    path_0.moveTo(size.width*0.7206831,size.height*0.07948127);
    path_0.lineTo(size.width*0.7430348,size.height*0.07948127);
    path_0.lineTo(size.width*0.7430348,size.height*0.3181556);
    path_0.lineTo(size.width*0.7206831,size.height*0.3181556);
    path_0.lineTo(size.width*0.7206831,size.height*0.07948127);
    path_0.close();
    path_0.moveTo(size.width*0.3930427,size.height*0.2435735);
    path_0.lineTo(size.width*0.6571698,size.height*0.2435735);
    path_0.lineTo(size.width*0.6571698,size.height*0.2681844);
    path_0.lineTo(size.width*0.3930427,size.height*0.2681844);
    path_0.lineTo(size.width*0.3930427,size.height*0.2435735);
    path_0.close();
    path_0.moveTo(size.width*0.8005667,size.height*0.2435735);
    path_0.lineTo(size.width*0.9029592,size.height*0.2435735);
    path_0.lineTo(size.width*0.9029592,size.height*0.2681844);
    path_0.lineTo(size.width*0.8005667,size.height*0.2681844);
    path_0.lineTo(size.width*0.8005667,size.height*0.2435735);
    path_0.close();
    path_0.moveTo(size.width*0.3930427,size.height*0.1888761);
    path_0.lineTo(size.width*0.6571698,size.height*0.1888761);
    path_0.lineTo(size.width*0.6571698,size.height*0.2134870);
    path_0.lineTo(size.width*0.3930427,size.height*0.2134870);
    path_0.lineTo(size.width*0.3930427,size.height*0.1888761);
    path_0.close();
    path_0.moveTo(size.width*0.8005667,size.height*0.1888761);
    path_0.lineTo(size.width*0.9029592,size.height*0.1888761);
    path_0.lineTo(size.width*0.9029592,size.height*0.2134870);
    path_0.lineTo(size.width*0.8005667,size.height*0.2134870);
    path_0.lineTo(size.width*0.8005667,size.height*0.1888761);
    path_0.close();
    path_0.moveTo(size.width*0.3930427,size.height*0.1341787);
    path_0.lineTo(size.width*0.6571698,size.height*0.1341787);
    path_0.lineTo(size.width*0.6571698,size.height*0.1587896);
    path_0.lineTo(size.width*0.3930427,size.height*0.1587896);
    path_0.lineTo(size.width*0.3930427,size.height*0.1341787);
    path_0.close();
    path_0.moveTo(size.width*0.8005667,size.height*0.1341787);
    path_0.lineTo(size.width*0.9029592,size.height*0.1341787);
    path_0.lineTo(size.width*0.9029592,size.height*0.1587896);
    path_0.lineTo(size.width*0.8005667,size.height*0.1587896);
    path_0.lineTo(size.width*0.8005667,size.height*0.1341787);
    path_0.close();
    path_0.moveTo(size.width*0.3930427,size.height*0.07948127);
    path_0.lineTo(size.width*0.6571698,size.height*0.07948127);
    path_0.lineTo(size.width*0.6571698,size.height*0.1040922);
    path_0.lineTo(size.width*0.3930427,size.height*0.1040922);
    path_0.lineTo(size.width*0.3930427,size.height*0.07948127);
    path_0.close();
    path_0.moveTo(size.width*0.8005667,size.height*0.07948127);
    path_0.lineTo(size.width*0.9029592,size.height*0.07948127);
    path_0.lineTo(size.width*0.9029592,size.height*0.1040922);
    path_0.lineTo(size.width*0.8005667,size.height*0.1040922);
    path_0.lineTo(size.width*0.8005667,size.height*0.07948127);
    path_0.close();
    path_0.moveTo(size.width*0.5889344,size.height*0.6968876);
    path_0.lineTo(size.width*0.4552967,size.height*0.6968876);
    path_0.lineTo(size.width*0.4552967,size.height*0.6660519);
    path_0.lineTo(size.width*0.5484810,size.height*0.6660519);
    path_0.cubicTo(size.width*0.5589485,size.height*0.6784438,size.width*0.5728003,size.height*0.6887608,size.width*0.5889344,size.height*0.6968876);
    path_0.close();
    path_0.moveTo(size.width*0.3610892,size.height*0.6968876);
    path_0.lineTo(size.width*0.2959232,size.height*0.6968876);
    path_0.lineTo(size.width*0.2959232,size.height*0.6654179);
    path_0.lineTo(size.width*0.2959232,size.height*0.4268012);
    path_0.lineTo(size.width*0.3380293,size.height*0.4268012);
    path_0.lineTo(size.width*0.3380293,size.height*0.6660519);
    path_0.lineTo(size.width*0.3610892,size.height*0.6660519);
    path_0.lineTo(size.width*0.3610892,size.height*0.6968876);
    path_0.close();
    path_0.moveTo(size.width*0.4336534,size.height*0.3234006);
    path_0.lineTo(size.width*0.4336534,size.height*0.3518732);
    path_0.cubicTo(size.width*0.4253896,size.height*0.3492219,size.width*0.4163387,size.height*0.3478386,size.width*0.4069731,size.height*0.3478386);
    path_0.cubicTo(size.width*0.3976074,size.height*0.3478386,size.width*0.3885566,size.height*0.3492219,size.width*0.3802928,size.height*0.3518732);
    path_0.lineTo(size.width*0.3802928,size.height*0.3234006);
    path_0.cubicTo(size.width*0.3802928,size.height*0.2975793,size.width*0.4336534,size.height*0.2975793,size.width*0.4336534,size.height*0.3234006);
    path_0.close();
    path_0.moveTo(size.width*0.6564615,size.height*0.4092795);
    path_0.lineTo(size.width*0.4528569,size.height*0.4092795);
    path_0.cubicTo(size.width*0.4460885,size.height*0.4230548,size.width*0.4280655,size.height*0.4328530,size.width*0.4069731,size.height*0.4328530);
    path_0.cubicTo(size.width*0.3858807,size.height*0.4328530,size.width*0.3679364,size.height*0.4230548,size.width*0.3611680,size.height*0.4092795);
    path_0.lineTo(size.width*0.1574847,size.height*0.4092795);
    path_0.lineTo(size.width*0.2531088,size.height*0.6174640);
    path_0.lineTo(size.width*0.2649142,size.height*0.6174640);
    path_0.cubicTo(size.width*0.2649142,size.height*0.6635735,size.width*0.2055722,size.height*0.7009798,size.width*0.1324571,size.height*0.7009798);
    path_0.cubicTo(size.width*0.05926334,size.height*0.7009798,0,size.height*0.6635735,0,size.height*0.6174640);
    path_0.lineTo(size.width*0.01180545,size.height*0.6174640);
    path_0.lineTo(size.width*0.1185267,size.height*0.3850720);
    path_0.cubicTo(size.width*0.1994333,size.height*0.3850720,size.width*0.2802613,size.height*0.3850720,size.width*0.3611680,size.height*0.3850720);
    path_0.cubicTo(size.width*0.3679364,size.height*0.3712968,size.width*0.3858807,size.height*0.3614409,size.width*0.4069731,size.height*0.3614409);
    path_0.cubicTo(size.width*0.4280655,size.height*0.3614409,size.width*0.4460885,size.height*0.3712968,size.width*0.4528569,size.height*0.3850720);
    path_0.cubicTo(size.width*0.5336849,size.height*0.3850720,size.width*0.6145915,size.height*0.3850720,size.width*0.6954195,size.height*0.3850720);
    path_0.lineTo(size.width*0.8022194,size.height*0.6174640);
    path_0.lineTo(size.width*0.8140249,size.height*0.6174640);
    path_0.cubicTo(size.width*0.8140249,size.height*0.6635735,size.width*0.7546828,size.height*0.7009798,size.width*0.6815678,size.height*0.7009798);
    path_0.cubicTo(size.width*0.6083740,size.height*0.7009798,size.width*0.5491107,size.height*0.6635735,size.width*0.5491107,size.height*0.6174640);
    path_0.lineTo(size.width*0.5609161,size.height*0.6174640);
    path_0.lineTo(size.width*0.6564615,size.height*0.4092795);
    path_0.close();
    path_0.moveTo(size.width*0.5918464,size.height*0.6174640);
    path_0.lineTo(size.width*0.7712105,size.height*0.6174640);
    path_0.lineTo(size.width*0.6815678,size.height*0.4221326);
    path_0.lineTo(size.width*0.5918464,size.height*0.6174640);
    path_0.close();
    path_0.moveTo(size.width*0.04273572,size.height*0.6174640);
    path_0.lineTo(size.width*0.2221785,size.height*0.6174640);
    path_0.lineTo(size.width*0.1324571,size.height*0.4221326);
    path_0.lineTo(size.width*0.04273572,size.height*0.6174640);
    path_0.close();
    path_0.moveTo(size.width*0.4069731,size.height*0.3829971);
    path_0.cubicTo(size.width*0.4176767,size.height*0.3829971,size.width*0.4263340,size.height*0.3893372,size.width*0.4263340,size.height*0.3971758);
    path_0.cubicTo(size.width*0.4263340,size.height*0.4049568,size.width*0.4176767,size.height*0.4112968,size.width*0.4069731,size.height*0.4112968);
    path_0.cubicTo(size.width*0.3963482,size.height*0.4112968,size.width*0.3876909,size.height*0.4049568,size.width*0.3876909,size.height*0.3971758);
    path_0.cubicTo(size.width*0.3876909,size.height*0.3893372,size.width*0.3963482,size.height*0.3829971,size.width*0.4069731,size.height*0.3829971);
    path_0.close();
    path_0.moveTo(size.width*0.4336534,size.height*0.4424784);
    path_0.lineTo(size.width*0.4336534,size.height*0.7565994);
    path_0.lineTo(size.width*0.5017315,size.height*0.7734294);
    path_0.lineTo(size.width*0.5017315,size.height*0.8000000);
    path_0.cubicTo(size.width*0.4385330,size.height*0.8000000,size.width*0.3754132,size.height*0.8000000,size.width*0.3122934,size.height*0.8000000);
    path_0.lineTo(size.width*0.3122934,size.height*0.7734294);
    path_0.lineTo(size.width*0.3802928,size.height*0.7565994);
    path_0.lineTo(size.width*0.3802928,size.height*0.4424784);
    path_0.cubicTo(size.width*0.3885566,size.height*0.4450720,size.width*0.3976074,size.height*0.4465130,size.width*0.4069731,size.height*0.4465130);
    path_0.cubicTo(size.width*0.4163387,size.height*0.4465130,size.width*0.4253896,size.height*0.4450720,size.width*0.4336534,size.height*0.4424784);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
