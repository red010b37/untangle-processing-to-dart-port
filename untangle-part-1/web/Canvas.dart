library canvas;

import 'dart:math';

import 'package:stagexl/stagexl.dart';

import 'Follower.dart';


class Canvas extends DisplayObjectContainer
{

  List<Follower> F;

  num timeStep = 1.0;
  num pAtt = 0.2;
  num pFol = 0.05;
  num drag = 1.0;
  num rest = 10;
  int pop = 64;
  int subPop = 64;
  bool dMode = false;
  
  
  
  Canvas(){
    
    
    F = new List<Follower>();
    
    Random r = new Random(345678);
    for(int i = 0; i < pop; i++)
    {
      
      Follower follower = new Follower(r.nextInt(500),r.nextInt(400),rest);
      F.add(follower);
      addChild(follower);
    }
    
    //set followers
    for(int i = 0; i < pop; i++)
    {
      int toFollow = (i+1);
      if(toFollow == pop)
      {
        toFollow = 0;
      }
      
      F[i].fL = F[toFollow];
    }
    
    this.onEnterFrame.listen(_onEnterFrame);
  }
  
  _onEnterFrame(EnterFrameEvent e) {
    for(int i = 0; i < pop; i++)
    {
      F[i].GetForce(pAtt, pFol);
    }
    
    
    for(int i = 0; i < pop; i++)
    {
      F[i].Update(timeStep, drag);
      
      /*if(dMode)
        F[i].DrawPos();
      else
        F[i].DrawTopo();
        */
    }
    
  }
  
}