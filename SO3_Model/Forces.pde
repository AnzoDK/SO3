class Force
{
  PVector force;
  String name;
  Force(String n,PVector v)
  {
    name = n;
    force = new PVector(v.x,v.y,v.z);
    
  }
  Force(String n,float x, float y)
  {
    name = n;
    force = new PVector(x,y,0);
    
  }
  Force(String n)
  {
    name = n;
    force = new PVector(0,0,0);
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
    super.force = b.velocity;
  }
  
  void Update()
  {
    super.force = ball.velocity;
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
    
    force = new PVector(tmp.x/100*directionX,tmp.y/100*directionY,0);
    
    
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
      text("Force: " + forces.get(i).name + "\n X: " + forceX + " Y: " + forceY, workRect.x+workRect.x,workRect.h/2);
      pop();
    } 
  }
}
