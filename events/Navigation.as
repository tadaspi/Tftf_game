/**
 * Created with IntelliJ IDEA.
 * User: TP
 * Date: 13.3.21
 * Time: 15.47
 * To change this template use File | Settings | File Templates.
 */
package com.tftf.events {
import starling.events.Event;

public class Navigation extends Event{

  public static const CHANGE_SCREEN: String = "changeScreen";

  public var params: Object;

  public function Navigation(type: String, _params: Object,  bubbles: Boolean = false) {
    super(type, bubbles);
    this.params = _params;
  }
}
}
