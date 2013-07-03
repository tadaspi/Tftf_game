/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.20
 * Time: 14.19
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.screens {
import com.greensock.TweenMax;
import com.greensock.easing.Sine;
import com.tftf.Assets;
import com.tftf.events.Navigation;

import starling.display.Button;
import starling.display.Image;
import starling.events.Event;
import starling.display.Sprite;

public class Welcome extends Sprite{

  private var title: Image;
  private var play: Button;

  public function Welcome() {
    super();
    this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  private function onAddedToStage(event: Event):void {
    drawScreen();
  }

  private function drawScreen(): void {

    title = new Image(Assets.getTexture("Title"));
    title.x = stage.stageWidth / 2 - title.width / 2;
    title.y = -title.height;
    this.addChild(title);

    play = new Button(Assets.getTexture("Play"));
    play.x = stage.stageWidth / 2 - play.width / 2;
    play.y = stage.stageHeight / 2 - play.height / 2 + 50;
    this.addChild(play);
  }

  public function initialize(): void{
    this.visible = true;

    TweenMax.to(title, 2, {
      x: stage.stageWidth / 2 - title.width / 2,
      y: stage.stageHeight / 2 - title.height / 2 - 100
    })
    TweenMax.fromTo(play, 0.15,
      {y:stage.stageHeight / 2 - play.height / 2 + 50},
      {y:stage.stageHeight / 2 - play.height / 2 + 100,
        ease:Sine.easeInOut, repeat:-1, yoyo:true
      });

    play.addEventListener(Event.TRIGGERED, playGame)

  }

  private function playGame(event: Event):void {
    this.removeEventListener(Event.TRIGGERED, playGame)



    this.dispatchEvent(new Navigation(Navigation.CHANGE_SCREEN, {id: "play"}, true))


  }

  public function disposeTemp():void {
    this.visible = false;
  }
}
}
