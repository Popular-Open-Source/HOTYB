- if exercise.errors
  ul.errors
    - exercise.errors.each do |error|
      li = error.to_s

== form(action: "/exercises/#{exercise.id.to_s}", enctype: "multipart/form-data", method: exercise.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: exercise.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "description", value: exercise.description, placeholder: "Description", class: "form-control")
  .form-group
    == file_field(name: "thumbnail", value: exercise.thumbnail, class: "form-control")
  .form-group
    == file_field(name: "demo_video", value: exercise.demo_video, class: "form-control")
  .form-group
    == select_field(name: "difficulty", collection: ExerciseView.difficulty_collection(), selected: exercise.difficulty, placeholder: "Difficulty", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/exercises", class: "btn btn-light btn-sm")
