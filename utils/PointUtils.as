/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.29
 * Time: 14.09
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.utils {
import flash.geom.Point;

import starling.display.Image;

public class PointUtils {
  public static function centerOf(image: Image): Point {
    return new Point(image.x + image.width / 2, image.y + image.height / 2);
  }
}
}
