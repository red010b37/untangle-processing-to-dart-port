import 'dart:html';
import 'package:stagexl/stagexl.dart';

import 'Canvas.dart';

Stage stage;

void main() {
// setup the Stage and RenderLoop 
  var canvas = query('#stage');
  stage = new Stage('myStage', canvas);
  
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);
  
  Canvas canvasD = new Canvas();
  
  stage.addChild(canvasD);
}



 
 




