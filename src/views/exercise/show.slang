h1 Show Exercise
p = exercise.name
p = exercise.description
img src=exercise.thumbnail height=500 width=500
p = exercise.demo_video
p = exercise.difficulty.to_s
p
  == link_to("Back", "/exercises", class: "btn btn-light btn-sm")
  == link_to("Edit", "/exercises/#{exercise.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/exercises/#{exercise.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
