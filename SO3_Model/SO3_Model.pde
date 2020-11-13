Field field;
ForceDrawer forceDrawer;
CoordinateSystem sys;
boolean mouseHeld = false;
boolean released = false;
void setup()
{
  size(1200,1000);
  frameRate(60);
  field = new Field();
  sys = new CoordinateSystem();
  forceDrawer = new ForceDrawer(new Rect(0,0,width/4,50));
  field.balls.add(new Ball(width/2,height-10,20));
  forceDrawer.AddForce(new Force("Gravity",0,1.82));
  forceDrawer.AddForce(new ForceTracker(field.balls.get(0)));
  forceDrawer.AddForce(new AirResistance());
  field.m_bDrawVectors = true;
  
  //field.balls.add(new Ball(10,0,20));
}

void draw()
{
  background(0);
  field.Update();
  sys.Update();
  forceDrawer.Update();
  sys.Draw();
  field.Draw();

  forceDrawer.Draw();
  released = false;

  
}

void mouseReleased()
{
  mouseHeld = false;
  released = true;
}
void mousePressed()
{
  
}

void mouseDragged()
{
  mouseHeld = true;
}

void keyTyped()
{
  if(keyPressed && key == 'r')
  {
    println("Resetting...");
    for(int i = 0; i < field.balls.size();i++)
    {
      println("Changing " + field.balls.get(i).m_rect.x + ", " + field.balls.get(i).m_rect.y + " to: " + field.balls.get(i).resetRect.x + ", " + field.balls.get(i).resetRect.y);
      field.balls.get(i).m_rect = new Rect(field.balls.get(i).resetRect);    
    }
  }
}