require "../models/exercise"

module ExerciseViewHelper
  extend self


  def difficulty_as_string(value : Int32 | Nil) : String
    case value
    when Exercise::Difficulty_Level::Beginner.value
      Exercise::Difficulty_Level::Beginner.to_s
    when Exercise::Difficulty_Level::Intermediate.value
      Exercise::Difficulty_Level::Intermediate.to_s
    when Exercise::Difficulty_Level::Advanced.value
      Exercise::Difficulty_Level::Advanced.to_s
    else
      ""
    end
  end
end