/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.20
 * Time: 13.48
 * To change this template use File | Settings | File Templates.
 */
package com.tftf {
import flash.display.Bitmap;
import flash.utils.Dictionary;

import starling.textures.Texture;

public class Assets {
  [Embed (source = "/com/tftf/assets/ball.png")]
  public static const Ball: Class;

  [Embed (source="/com/tftf/assets/welcome/play.png")]
  public static const Play: Class;

  [Embed (source="/com/tftf/assets/welcome/title.png")]
  public static const Title: Class;

  [Embed (source="/com/tftf/assets/reset.png")]
  public static const Reset: Class;

  private static var gameTextures: Dictionary = new Dictionary();

  public static function getTexture(name: String): Texture {
    if (gameTextures[name] == undefined) {
      var bitmap: Bitmap = new Assets[name]();
      gameTextures[name] = Texture.fromBitmap(bitmap);
    }
    return gameTextures[name];
  }

  public function Assets() {
  }
}
}
