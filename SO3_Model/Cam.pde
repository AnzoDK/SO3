class Cam extends ObjBase
{
  boolean camActive = false;
  Point2D realPoint;
 Cam(Rect r)//The rect is used to determine the viewport and position of the cam
 {
  super(r);
  GetRealPoint();
 }
 Cam(float x, float y, float w, float h)
 {
   super(x,y,w,h);
   GetRealPoint();
 }
 void Update()
 {
   Ball b = field.balls.get(0);
   if(b.m_rect.x > width && !camActive)
   {
     camActive = true;
     println("Activating Cam");
   }
   
 }
 void Draw()
 {
   if(camActive)
   {
     Ball b = field.balls.get(0);
     push();
     stroke(255);
     strokeWeight(3);
     fill(0);
     rect(m_rect.x,m_rect.y,m_rect.w,m_rect.h);
     pop();
     push();
     fill(b.clr);
     
     if(height-b.m_rect.y < m_rect.h/2)
     {
       circle(m_rect.x+(m_rect.w/2),(m_rect.y+m_rect.h)-(height-b.m_rect.y),b.radius);
       stroke(150,150,150);
       strokeWeight(3);
       line(m_rect.x,m_rect.h,m_rect.x+m_rect.w,m_rect.h);
       int offset = (int)b.m_rect.x;
       for(int i = offset-(int)m_rect.w/2; i < m_rect.w+offset;i++)
       {
          if(i%sys.everyX == 0)
          {
            line(i-(offset-(int)(m_rect.w/2))+m_rect.x,m_rect.y+m_rect.h,i-(offset-(int)(m_rect.w/2))+m_rect.x,m_rect.y+m_rect.h-20);
            if(sys.drawNumbers)
            {
              fill(255);
              text(i,i-(offset-(int)(m_rect.w/2))+m_rect.x,m_rect.y+m_rect.h-23);
            }
        }
      }
     }
     else
     {
      circle(m_rect.x+(m_rect.w/2),m_rect.y+(m_rect.h/2),b.radius); 
     }
     pop();
   }
 }
 private void GetRealPoint()
 {
   if(field.balls.size() > 0)
   {
     if(field.balls.get(0) != null)
     {
       realPoint = field.balls.get(0).m_rect.ToPoint2D();
     }
   }
   else
   {
     realPoint = new Point2D();
   }
 }
}
