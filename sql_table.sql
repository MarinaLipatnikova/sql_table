CREATE TABLE IF NOT EXISTS Music_Website (
	id SERIAL PRIMARY KEY
);


CREATE TABLE IF NOT EXISTS Genre (
	id INTEGER PRIMARY KEY REFERENCES Music_Website(id),
	title VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenrePerformer (
	genre_id INTEGER REFERENCES Genre(id),
	performer_id INTEGER REFERENCES Performer(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	year_of_release date
);

CREATE TABLE IF NOT EXISTS AlbumPerformer (
	album_id INTEGER REFERENCES Album(id),
	performer_id INTEGER REFERENCES Performer(id),
	CONSTRAINT pk_ap PRIMARY KEY (album_id, performer_id)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	duration DECIMAL (5, 2),
	album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	year_of_release date
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	track_id INTEGER REFERENCES Track(id),
	collection_id INTEGER REFERENCES Collection(id),
	CONSTRAINT pk_tc PRIMARY KEY (track_id, collection_id)
);