package org.hamcrest.object {
public final class QualifiedName {
  public function QualifiedName(name:QName) {
    _name = name;
  }
  
  private var _name:QName;
  public function get name():QName {
    return _name;
  }

  public function toString():String {
    return _name.toString();
  }
}
}
