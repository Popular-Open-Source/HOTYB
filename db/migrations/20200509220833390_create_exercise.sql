-- +micrate Up
CREATE TABLE exercises (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name VARCHAR NOT NULL,
  description VARCHAR NOT NULL,
  thumbnail VARCHAR NOT NULL,
  demo_video VARCHAR NOT NULL,
  difficulty INT NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX exercises_index
ON exercises (name, difficulty);

-- +micrate Down
DROP TABLE IF EXISTS exercises;
