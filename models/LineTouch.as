/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.29
 * Time: 13.57
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.models {
import flash.geom.Point;

public class LineTouch {
  private var _start: Point;
  private var _end: Point;
  private var _length: Number;

  public function LineTouch(start:Point, end:Point) {
    this._start = start;
    this._end = end;
    this._length = Point.distance(start, end);
  }

  public function get start():Point {
    return _start;
  }

  public function get end():Point {
    return _end;
  }

  public function get length():Number {
    return _length;
  }
}
}
