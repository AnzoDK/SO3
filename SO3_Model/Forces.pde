class Force
{
  PVector force;
  String name;
  boolean inUse;
  Force(String n,PVector v)
  {
    name = n;
    force = new PVector(v.x,v.y,v.z);
    inUse = true;
    
  }
  Force(String n,float x, float y)
  {
    name = n;
    force = new PVector(x,y,0);
    inUse = true;
    
  }
  Force(String n,float x, float y,boolean enable)
  {
    name = n;
    force = new PVector(x,y,0);
    inUse = enable;
    
  }
  Force(String n)
  {
    name = n;
    force = new PVector(0,0,0);
    inUse = true;
  }
  void Update()
  {
    
    
  }
}

class ForceTracker extends Force
{
  Ball ball;
  ForceTracker(Ball b)
  {
    super("Ball");
    ball = b;
    super.force = new PVector(b.velocity.x,b.velocity.y,0);
  }
  
  void Update()
  {
    super.force = new PVector(ball.velocity.x,ball.velocity.y,0);
    super.force.y = super.force.y*-1;
  }
}

class AirResistance extends Force
{
  AirResistance()
  {
    super("Air Resistance");
    
  }
  void Update()
  {
    PVector tmp = field.balls.get(0).velocity;
    float directionX = (tmp.x *-1)/tmp.x;
    float directionY = (tmp.y *-1)/tmp.y;
    float newX = tmp.x/100*directionX;
    //println("NewX = "+newX);
    if(newX > (float)-0.0001)
    {
      newX = 0;
      println("NewX is too small");
    }
    force = new PVector(newX,tmp.y/100*directionY,0);
    
    
  }
}

class ForceDrawer extends ObjBase
{
  ArrayList<Force> forces;
  ForceDrawer(Rect r)//Uses Rect r as the area where we are allowed to draw the text
  {
    super(r);
    forces = new ArrayList<Force>();
  }
  
  void AddForce(Force f)
  {
    forces.add(f);
  }
  
  Force GetForceByName(String s)
  {
    for(int i = 0; i < forces.size();i++)
    {
      if(forces.get(i).name == s)
      {
        return forces.get(i);
      }
    }
    return new Force("Empty");
  }
  
  void Update()
  {
    
    for(int i = 0; i < forces.size();i++)
    {
      forces.get(i).Update();
      
    }
    
  }
  
  void Draw()
  {
    for(int i = 0; i < forces.size();i++)
    {
      push();
      Rect workRect = new Rect(m_rect.x+((m_rect.w/forces.size())*i),m_rect.y,m_rect.w/forces.size(),m_rect.h);
      fill(255,255,255);
      textSize(workRect.w/5);
      String forceX = new String();
      forceX += forces.get(i).force.x;
      String forceY = new String();
      forceY +=forces.get(i).force.y;
      int forceXIndex = forceX.indexOf(".");
      int forceYIndex = forceX.indexOf(".");
      if(forceXIndex > -1)
      {
        if(forceX.substring(forceXIndex).length() > 3)
        {
          forceX = forceX.substring(0,forceXIndex+3);
        }
      }
      if(forceYIndex > -1)
      {
        if(forceY.substring(forceYIndex).length() > 3)
        {
          forceY = forceY.substring(0,forceYIndex+3);
        }
      }
      if(forces.get(i).name.contains("Ball") || forces.get(i).name.contains("Air"))
      {
        text("Force: " + forces.get(i).name + "\n X: " + forceX + " Y: " + forceY, workRect.x+workRect.x,workRect.h/2);
      }
      else
      {
        text("Force: " + forces.get(i).name + "\n X: " + (float(forceX)*-1) + " Y: " + (float(forceY)*-1), workRect.x+workRect.x,workRect.h/2);
      }
      pop();
    } 
  }
}
