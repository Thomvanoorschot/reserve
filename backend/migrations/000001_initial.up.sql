CREATE TABLE location (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE resource (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    location_id INTEGER NOT NULL,
    minimum_segments INTEGER  NOT NULL,
    maximum_segments INTEGER  NOT NULL,
    default_availability_1 INTEGER NOT NULL,
    default_availability_2 INTEGER NOT NULL,
    FOREIGN KEY(location_id) REFERENCES location(id)
);

CREATE TABLE resource_override (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    availability_1 INTEGER NOT NULL,
    availability_2 INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    FOREIGN KEY(resource_id) REFERENCES resource(id)
);

CREATE TABLE reservation (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id VARCHAR(24) NOT NULL,
    end_at TIMESTAMP NOT NULL,
    availability_1 INTEGER NOT NULL,
    availability_2 INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    FOREIGN KEY(resource_id) REFERENCES resource(id)
);

INSERT INTO location VALUES(1, 'testlocation');
INSERT INTO resource VALUES (1, 'court1', 1, 1, 4, 0, 9223372036854775807);