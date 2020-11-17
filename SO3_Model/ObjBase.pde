enum Shape{circle,square};

class Point2D
{
 float x,y;
 Point2D(float _x, float _y)
 {
   x = _x;
   y = _y;
 }
 Point2D()
 {
   x = 0;
   y = 0;
 }
}

class Rect
{
  float x, y, w, h;
  Rect(int _x, int _y, int _w, int _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  Rect(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  Rect()
  {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
  }
  Rect(Rect r)
  {
    x = r.x;
    y = r.y;
    w = r.w;
    h = r.h;
  }
  Point2D ToPoint2D()
  {
    return new Point2D(x,y);
  }
}


class ObjBase
{
  
  boolean m_bEnabled = true;
  float radius;
  Shape shape;
  Rect m_rect;
  ObjBase(Shape s)
  {
   shape = s;
   m_rect = new Rect();
  }
  
  ObjBase(Rect r, float _radius)
  {
    m_rect = r;
    radius = _radius;
    shape = Shape.circle;
  }
  
  ObjBase(Rect r)
  {
    m_rect = r;
    shape = Shape.square;
  }
  ObjBase(float x, float y, float w, float h)
  {
    Rect r = new Rect(x,y,w,h);
    m_rect = r;
    shape = Shape.square;
  }
  
  void Update()
  {
    
    
  }
  
  void Draw()
  {
    
  }
}
