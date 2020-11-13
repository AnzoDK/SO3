enum Shape{circle,square};

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
  
  void Update()
  {
    
    
  }
  
  void Draw()
  {
    
  }
}
