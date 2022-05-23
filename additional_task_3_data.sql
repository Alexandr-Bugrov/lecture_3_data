CREATE TABLE IF NOT EXISTS employee(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    departament VARCHAR(80) NOT NULL,
    chief INTEGER REFERENCES employee(id)
)