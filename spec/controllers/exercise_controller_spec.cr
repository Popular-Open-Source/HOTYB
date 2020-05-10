require "./spec_helper"

def exercise_hash
  {"name" => "Fake", "description" => "Fake", "thumbnail" => "Fake", "demo_video" => "Fake", "difficulty" => "1"}
end

def exercise_params
  params = [] of String
  params << "name=#{exercise_hash["name"]}"
  params << "description=#{exercise_hash["description"]}"
  params << "thumbnail=#{exercise_hash["thumbnail"]}"
  params << "demo_video=#{exercise_hash["demo_video"]}"
  params << "difficulty=#{exercise_hash["difficulty"]}"
  params.join("&")
end

def create_exercise
  model = Exercise.new(exercise_hash)
  model.save
  model
end

class ExerciseControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe ExerciseControllerTest do
  subject = ExerciseControllerTest.new

  it "renders exercise index template" do
    Exercise.clear
    response = subject.get "/exercises"

    response.status_code.should eq(200)
    response.body.should contain("exercises")
  end

  it "renders exercise show template" do
    Exercise.clear
    model = create_exercise
    location = "/exercises/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Exercise")
  end

  it "renders exercise new template" do
    Exercise.clear
    location = "/exercises/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Exercise")
  end

  it "renders exercise edit template" do
    Exercise.clear
    model = create_exercise
    location = "/exercises/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Exercise")
  end

  it "creates a exercise" do
    Exercise.clear
    response = subject.post "/exercises", body: exercise_params

    response.headers["Location"].should eq "/exercises"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a exercise" do
    Exercise.clear
    model = create_exercise
    response = subject.patch "/exercises/#{model.id}", body: exercise_params

    response.headers["Location"].should eq "/exercises"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a exercise" do
    Exercise.clear
    model = create_exercise
    response = subject.delete "/exercises/#{model.id}"

    response.headers["Location"].should eq "/exercises"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
