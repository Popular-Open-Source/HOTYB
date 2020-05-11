h1 = exercise.name
p = "Difficulty Level "
  span class="text-primary"
    = exercise.difficulty
p = exercise.description
.row
  .col-6
    img src=exercise.thumbnail class="img-fluid"
  .col-6
    video controls="true" src=exercise.demo_video class="img-fluid"
p
  == link_to("Back", "/exercises", class: "btn btn-light btn-sm")
  == link_to("Edit", "/exercises/#{exercise.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/exercises/#{exercise.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
