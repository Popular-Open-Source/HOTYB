require "../models/exercise"

class ExerciseView
  getter id : Int64?
  getter name : String
  getter description : String
  getter thumbnail : String
  getter demo_video : String
  getter difficulty : String

  def initialize(exercise : Exercise)
    @id = exercise.id
    @name = exercise.name
    @description = exercise.description
    @thumbnail = exercise.thumbnail
    @demo_video = exercise.demo_video
    @difficulty = difficulty_as_string(exercise.difficulty)
    @exercise = exercise
  end

  def errors
    @exercise.errors
  end

  private def difficulty_as_string(value : Int32 | Nil) : String
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

  def self.difficulty_collection()
    [
      ["", "Select Difficulty"],
      [Exercise::Difficulty_Level::Beginner.value, Exercise::Difficulty_Level::Beginner],
      [Exercise::Difficulty_Level::Intermediate.value, Exercise::Difficulty_Level::Intermediate],
      [Exercise::Difficulty_Level::Advanced.value, Exercise::Difficulty_Level::Advanced]
    ]
  end
end