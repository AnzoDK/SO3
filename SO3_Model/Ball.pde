class Ball extends ObjBase
{
  PVector velocity;
  float mass;
  color clr;
  boolean locked = false;
  boolean override = false;
  Rect resetRect;
  Ball(float x, float y, float radius, float _mass)
  {
    super(new Rect(x,y,0,0),radius);
    velocity = new PVector(0,0,0);
    resetRect = new Rect(x,y,0,0);
    clr = color(255,0,0);
    //mass = 9.73;
    mass = _mass;
    
  }
  
  void Update()
  {
    if(m_bEnabled)
    {
      if(((m_rect.y + velocity.y >= height-radius) || (m_rect.y >= height-radius)) && !override)
      {
        m_rect.y = height-radius;
        velocity.y = 0;
        velocity.x = 0;
      }
      else
      {
        m_rect.x += velocity.x;
        m_rect.y += velocity.y;
        override = false;
      }
      if(velocity.y == 0 && velocity.x == 0)
      {
        clr = color(255,0,0);
        if((sqrt(pow(mouseX-m_rect.x,2)+pow(mouseY-m_rect.y,2)) <= radius))
        {
          clr = color(255,255,255);
        }
        if(mousePressed && (mouseButton == LEFT) && (sqrt(pow(mouseX-m_rect.x,2)+pow(mouseY-m_rect.y,2)) <= radius) && (!locked))
        {
          locked = true;
          println("locking");
        }
        else if(mousePressed && (mouseButton == LEFT) && locked && (sqrt(pow(mouseX-m_rect.x,2)+pow(mouseY-m_rect.y,2)) >= radius))
         {
          if(locked)
          {
            println("Released");
            //PVector newForce = new PVector(((mouseX-m_rect.x)*mass),((mouseY-m_rect.y)*mass));
            PVector newForce = new PVector((510*mass),(-510*mass));
            velocity.add(newForce); 
            locked = false;
            println("Adding force: " + newForce.x + ", " + (newForce.y*-1));
            override = true;
          }
         }
        
      }
    }
  }
  
  void Draw()
  {
    if(m_bEnabled)
    {
      push();
      fill(clr);
      circle(m_rect.x,m_rect.y,radius);
      pop();
      if(locked)
      {
         push();
         strokeWeight(5);
         stroke(255,255,255);
         line(m_rect.x,m_rect.y,mouseX,mouseY);
         float angle = atan((((float)mouseY-(float)m_rect.y)/((float)mouseX-(float)m_rect.x)));
         
         
         text(((angle*180)/PI)*-1,mouseX,mouseY);
         pop();
      }
    }
  }
}
