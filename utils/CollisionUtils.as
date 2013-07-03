/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.29
 * Time: 14.17
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.utils {
import flash.geom.Point;

public class CollisionUtils {
  public static function lineAndPoint(
    lineStart: Point, lineEnd: Point, point: Point, radius: int
  ): Boolean {
    var x1: Number = lineStart.x - point.x;
    var y1: Number = lineStart.y - point.y;
    var x2: Number = lineEnd.x - point.x;
    var y2: Number = lineEnd.y - point.y;
    var dx: Number = x2 - x1;
    var dy: Number = y2 - y1;
    var dr: Number = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy,  2));
    var d: Number = x1 * y2 - x2 * x1;
    var delta: Number = Math.pow(radius * 0.9, 2) * Math.pow(dr,  2) - Math.pow(d,  2)
    return delta >= 0;
  }
}
}
