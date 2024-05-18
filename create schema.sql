

create schema marvel;

CREATE TABLE marvel.avengers (
    name VARCHAR(100),
    age INT,
    alias VARCHAR(100),
    ability VARCHAR(255),
    power INT,
    category VARCHAR(100)
);


CREATE TABLE marvel.superpowers (
    id INT,
    name VARCHAR(100),
    description VARCHAR(255),
    power_type1 VARCHAR(100),
    power_type2 VARCHAR(100),
    power_type3 VARCHAR(100)
);


CREATE TABLE marvel.power_scores (
    power_type1 VARCHAR(100),
    score INT,
    zone VARCHAR(1)
);

