package com.tftf {
import com.tftf.screens.InGame;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import starling.core.Starling;
import flash.display.Sprite;

import starling.core.StatsDisplay;


[SWF (frameRate = "60", backgroundColor = "000000", width = "1280", height = "720")]
public class Runner extends Sprite {

  private var mStarling: Starling;

  public function Runner() {

    super();

    // These settings are recommended to avoid problems with touch handling

    stage.scaleMode = StageScaleMode.NO_SCALE;
    stage.align = StageAlign.TOP_LEFT;

    Starling.multitouchEnabled = true;

    // Create a Starling instance that will run the "Game" class


    mStarling = new Starling(Game, stage);

    mStarling.simulateMultitouch = true;

    stage.addEventListener(Event.RESIZE, resizeStage);

    mStarling.start();

    mStarling.antiAliasing = 1;

    mStarling.showStats = true;


  }
  protected function resizeStage(event:Event): void {
    var viewPortRectangle:Rectangle = new Rectangle();
    viewPortRectangle.width = stage.stageWidth;
    viewPortRectangle.height = stage.stageHeight;
    Starling.current.viewPort = viewPortRectangle;
  }
}
}
