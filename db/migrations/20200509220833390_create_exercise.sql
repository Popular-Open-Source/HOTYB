-- +micrate Up
CREATE TABLE exercises (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  description VARCHAR,
  thumbnail VARCHAR,
  demo_video VARCHAR,
  difficulty INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX exercises_index
ON exercises (name, difficulty);

-- +micrate Down
DROP TABLE IF EXISTS exercises;
