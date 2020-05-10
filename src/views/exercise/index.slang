.row
  .col-sm-11
    h2 Exercises
  .col-sm-1
    a.btn.btn-success.btn-sm href="/exercises/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Description
        th Thumbnail
        th Demo_video
        th Difficulty
        th Actions
    tbody
      - exercises.each do |exercise|
        tr
          td = exercise.name
          td = exercise.description
          td 
            img src=exercise.thumbnail height=250 width=250
          td = exercise.demo_video
          td = exercise.difficulty
          td
            span
              == link_to("Show", "/exercises/#{exercise.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/exercises/#{exercise.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/exercises/#{ exercise.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
