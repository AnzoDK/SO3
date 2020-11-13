class Field extends ObjBase
{
  boolean m_bDrawVectors = false;
  ArrayList<Ball> balls;
  PVector gravity;
  Field()
  {
    super(new Rect(0,0,width,height));
    balls = new ArrayList<Ball>();
    //gravity = new PVector(0,9.82,0);
    //gravity = new PVector(0,2.1,0);
  }
  
  void Draw()
  {
    if(m_bEnabled)
    {
      push();
      for(int i = 0; i < balls.size();i++)
      {
        balls.get(i).Draw();
        if(m_bDrawVectors)
        {
          
        }
      }
      pop();
    }
  }
  void Update()
  {
    if(m_bEnabled)
    {
      for(int i = 0; i < balls.size();i++)
      {
        for(int u = 0; u < forceDrawer.forces.size();u++)
        {
          if(!forceDrawer.forces.get(u).name.contains("Ball"))
          {
            balls.get(i).velocity.add(forceDrawer.forces.get(u).force);      
          }
        }
        balls.get(i).Update();
        
      }
    }
  }
  void ToggleBallAt(int index)
  {
    balls.get(index).m_bEnabled = !balls.get(index).m_bEnabled;
  }
  
  
}
