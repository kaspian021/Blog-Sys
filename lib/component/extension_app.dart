
import 'package:flutter/cupertino.dart';

extension SizedBoxApp on double{

  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());


}