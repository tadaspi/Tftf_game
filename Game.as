/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.20
 * Time: 13.13
 * To change this template use File | Settings | File Templates.
 */
package com.tftf {
import com.tftf.events.Navigation;
import com.tftf.screens.InGame;
import com.tftf.screens.Welcome;

import starling.events.Event;

import starling.display.Sprite;

public class Game extends Sprite{

  private var screenWelcome: Welcome;
  private var screenInGame: InGame;

  public function Game(){
    super();
    this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
  }



  private function onAddedToStage(event: Event):void {

    this.addEventListener(Navigation.CHANGE_SCREEN, onChangeScreen)

    screenInGame = new InGame();
    screenInGame.disposeTemp();
    this.addChild(screenInGame);

    screenWelcome = new Welcome();
    this.addChild(screenWelcome);
    screenWelcome.initialize();



  }

  private function onChangeScreen(event: Navigation):void {
    switch (event.params.id) {
      case "play":
        screenWelcome.disposeTemp();
        screenInGame.initialize();
        break;
    }
  }
}
}
