class CoordinateSystem extends ObjBase
{
  float everyX;
  float everyY;
  boolean drawNumbers = false;
  CoordinateSystem()
  {
    super(new Rect(0,height,width,-height));
    everyX = 100;
    everyY = 100;
  }
  
  void Draw()
  {
    push();
    translate(m_rect.x,m_rect.y);
    strokeWeight(10);
    stroke(150,150,150);
    line(0,0,0,-height);
    line(0,0,width,0);
    stroke(0,255,0);
    strokeWeight(5);
    for(int i = 0; i < width;i++)
    {
      if(i%everyX == 0)
      {
        line(i,0,i,-20); //<>//
        if(drawNumbers)
        {
          text(i,i,-25);
        }
      }
    }
    for(int i = 0; i > -height;i--)
    {
      if(i%everyY == 0)
      {
        line(0,i,20,i);
        if(drawNumbers)
        {
          text(i*-1,25,i);
        }
      }
    }
    pop();
  }
  
}
