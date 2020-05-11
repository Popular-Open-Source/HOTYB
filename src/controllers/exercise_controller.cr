require "../helpers/uploader"
require "../view_models/exercise_view"

class ExerciseController < ApplicationController

  getter exercise = Exercise.new
  getter uploader = Uploader.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_exercise }
  end

  def index
    exercises = Exercise.all.map {|ex| ExerciseView.new(ex)}
    render "index.slang"
  end

  def show
    exercise = ExerciseView.new(@exercise)
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    exercise = Exercise.new exercise_params.validate!
    begin
      video = params.files["demo_video"]
      image = params.files["thumbnail"]
      exercise.thumbnail = uploader.upload_public_image(image.file)
      exercise.demo_video = uploader.upload_public_file(video.file)
    rescue ex : BaseUploader::UploadException
    end

    if exercise.save
      redirect_to action: :index, flash: {"success" => "Exercise has been created."}
    else
      flash[:danger] = "Could not create Exercise!"
      render "new.slang"
    end
  end

  def update
    exercise.set_attributes exercise_params.validate!
    if exercise.save
      redirect_to action: :index, flash: {"success" => "Exercise has been updated."}
    else
      flash[:danger] = "Could not update Exercise!"
      render "edit.slang"
    end
  end

  def destroy
    exercise.destroy
    redirect_to action: :index, flash: {"success" => "Exercise has been deleted."}
  end

  private def exercise_params
    params.validation do
      required :name
      required :description
      required :difficulty
    end
  end

  private def set_exercise
    @exercise = Exercise.find! params[:id]
  end
end
