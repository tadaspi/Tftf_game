/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.20
 * Time: 18.47
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.screens {

import com.tftf.Assets;
import com.tftf.models.LineTouch;
import com.tftf.utils.CollisionUtils;
import com.tftf.utils.PointUtils;

import starling.display.Button;

import starling.display.Image;
import starling.display.Quad;
import starling.events.Event;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class InGame extends Sprite{

  private var ball: Image;
  private var directionX: Number;
  private var directionY: Number;
  private var speedRadius: Number = 8;
  private var angle: Number;
  private var rectangle: Quad;
  private var back: Quad;

  private var screenTouch: LineTouch;

  public function InGame() {
    super();
    this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    this.addEventListener(Event.ENTER_FRAME, eachFrame);
  }

  public function disposeTemp(): void {
    this.visible = false;
  }

  public function initialize(): void {
    this.visible = true;
  }

  private function onAddedToStage(event: Event):void {
    back = new Quad(stage.stageWidth, stage.stageHeight, 0x000000);
    this.addChild(back);
    this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    createReset();
    createBall();
    this.addEventListener(TouchEvent.TOUCH, touchHandler);
  }

  private function touchHandler(event: TouchEvent):void {
    var touchesON: Vector.<Touch> = event.getTouches(this,  TouchPhase.BEGAN);
    var touchesOFF: Vector.<Touch> = event.getTouches(this,  TouchPhase.ENDED);
    if (touchesON) {
      if (touchesON.length == 1) {
        trace("place two fingers")
      }
      else if (touchesON.length == 2) {
        trace("2 fingers")
        screenTouch = new LineTouch(
          touchesON[0].getLocation(this),
          touchesON[1].getLocation(this)
        );

        rectangle = new Quad(screenTouch.length, 3, 0xFFFFFF);
        rectangle.x = screenTouch.start.x;
        rectangle.y = screenTouch.start.y;
        rectangle.rotation = Math.atan2(
          screenTouch.end.y - screenTouch.start.y,
          screenTouch.end.x - screenTouch.start.x
        );
        this.addChild(rectangle);
      } else {
        this.removeChild(rectangle);
        screenTouch = null;
      }
    }
  }

  private function createReset():void {
    var reset: Button = new Button(Assets.getTexture("Reset"), "RESET");
    reset.addEventListener(Event.TRIGGERED, resetHandler);
    reset.x = 0;
    reset.y = 50;
    this.addChild(reset);
  }

  private function resetHandler(event: Event):void {
    ball.x = stage.stageWidth / 2;
    ball.y = stage.stageHeight / 2;
    speedRadius = 8
    moveBall();
  }

  private function createBall():void {
    ball = new Image(Assets.getTexture("Ball"));
    ball.x = stage.stageWidth / 2;
    ball.y = stage.stageHeight / 2;
    this.addChild(ball);
    moveBall();
  }

  private function moveBall(): void {
    angle =  Math.random() * Math.PI * 2;
    directionX = Math.cos(angle);
    directionY = Math.sin(angle);
  }

  private function eachFrame(event: Event): void {
    if (ball != null) updateBall();
  }

  private function updateBall():void {
    if (ball.x + ball.width >= stage.stageWidth || ball.x <= 0) {
      ball.x -= directionX * speedRadius;
      ball.y += directionY * speedRadius;
      directionX *= -1;
    }
    else if (ball.y + ball.height >= stage.stageHeight || ball.y <= 0) {
      ball.x += directionX * speedRadius;
      ball.y -= directionY * speedRadius;
      directionY *= -1;
    }
    else if (screenTouch != null && CollisionUtils.lineAndPoint(
      screenTouch.start, screenTouch.end,
      PointUtils.centerOf(ball), ball.width / 2
    )) {
      trace("HIT")
      var angleInRad: Number = Math.atan2(ball.x - screenTouch.end.x, ball.y - screenTouch.end.y);
      var angleInDeg: Number = angleInRad * 180 / Math.PI;
      trace(angleInDeg);


    } else {
      ball.x += directionX * speedRadius;
      ball.y += directionY * speedRadius;
      speedRadius -= 0.002;
    }
  }

}
}
