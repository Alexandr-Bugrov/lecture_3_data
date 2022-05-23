CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS band (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	date_of_realise DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS track(
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES album(id),
	name VARCHAR(30) NOT NULL,
	duration INTEGER NOT NULL
);


CREATE TABLE IF NOT EXISTS collection(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	date_of_realise DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS band_genre(
	genre INTEGER REFERENCES genre(id),
	band INTEGER REFERENCES band(id),
	CONSTRAINT pk_band_genre PRIMARY KEY(genre, band)
);


CREATE TABLE IF NOT EXISTS band_album(
	band INTEGER REFERENCES band(id),
	album INTEGER REFERENCES album(id),
	CONSTRAINT pk_band_album PRIMARY KEY(band, album)
);


CREATE TABLE IF NOT EXISTS tracks_in_collection(
	track INTEGER REFERENCES track(id),
	collection INTEGER REFERENCES collection(id),
	CONSTRAINT pk_tracks_in_collection PRIMARY KEY(track, collection)
);