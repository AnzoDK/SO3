class Logger
{
  String path;
  boolean active = false;
  boolean extraLog = true;
  ArrayList<String> workArray;
  Logger()
  {
    CreatePath();
    workArray = new ArrayList<String>();
    CreateHeaders();
  }
  
  void Update()
  {
    if(field.balls.size() > 0)
    {
       if(field.balls.get(0) != null)
       {
         if(field.balls.get(0).velocity.x != 0 && field.balls.get(0).velocity.y != 0)
         {
           active = true;
           String tmp = new String();
           tmp += frameCount+","+field.balls.get(0).m_rect.x+","+((field.balls.get(0).m_rect.y-height+field.balls.get(0).radius)*-1)+","+"("+field.balls.get(0).velocity.x+";"+field.balls.get(0).velocity.y+")";
           workArray.add(tmp);
         }
         else if(active && extraLog)
         {
           extraLog = false;
           String tmp = new String();
           tmp += frameCount+","+field.balls.get(0).m_rect.x+","+((field.balls.get(0).m_rect.y-height+field.balls.get(0).radius)*-1)+","+"("+field.balls.get(0).velocity.x+";"+field.balls.get(0).velocity.y+")";
           workArray.add(tmp);
         }
         else if(active && !extraLog)
         {
           active = false;
           String[] arr = new String[workArray.size()];
           for(int i = 0; i < workArray.size();i++)
           {
             arr[i] = workArray.get(i);
           }
           saveStrings(path,arr);
         }
       }
    }
  }
  
  void CreateHeaders()
  {
    String s_headers = "frame(1 sec = 60 frames), PosX, PosY, VelocityVector";
    workArray.add(s_headers);
  }
  void CreatePath()
  {
    path = new String();
    path += day() + "-" + month() + "-" + year() + "_" + hour() + "." + minute() + "." + second() + ".csv";
  }
  void Reset()
  {
    active = false;
    CreatePath();
    workArray.clear();
    CreateHeaders();
    
  }
}
