class Exercise < Granite::Base
  connection pg
  table exercises

  enum Difficulty_Level
    Beginner
    Intermediate
    Advanced
  end

  column id : Int64, primary: true
  column name : String = ""
  column description : String = ""
  column thumbnail : String = ""
  column demo_video : String = ""
  column difficulty : Int32 = -1
  timestamps
end
