CREATE TABLE location (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    name TEXT NOT NULL,
    default_availability_id UUID,
    tz TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(default_availability_id) REFERENCES availability (id)
);

CREATE TABLE resource (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    name TEXT NOT NULL,
    location_id UUID NOT NULL,
    minimum_segments INTEGER  NOT NULL,
    maximum_segments INTEGER  NOT NULL,
    allow_invalid_segments BOOLEAN NOT NULL,
    default_availability_id UUID NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(location_id) REFERENCES location(id),
    FOREIGN KEY(default_availability_id) REFERENCES availability (id)
);

CREATE TABLE resource_availability_override (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    resource_id UUID NOT NULL,
    availability_id UUID NOT NULL,

    name TEXT,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(resource_id) REFERENCES resource(id),
    FOREIGN KEY(availability_id) REFERENCES availability (id)
);

CREATE TABLE reservation (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    user_id VARCHAR(24) NOT NULL,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    resource_id UUID NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(resource_id) REFERENCES resource(id)
);

CREATE TABLE availability (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    part_one UNSIGNED INTEGER NOT NULL,
    part_two UNSIGNED INTEGER NOT NULL,
    part_three UNSIGNED INTEGER NOT NULL,
    part_four UNSIGNED INTEGER NOT NULL,
    part_five UNSIGNED INTEGER NOT NULL,
    part_six UNSIGNED INTEGER NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP
);


CREATE TRIGGER update_updated_at_location AFTER UPDATE ON location
BEGIN
    UPDATE location SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_resource AFTER UPDATE ON resource
BEGIN
    UPDATE resource SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_reservation AFTER UPDATE ON reservation
BEGIN
    UPDATE reservation SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_availability AFTER UPDATE ON availability
BEGIN
    UPDATE availability SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_resource_availability_override AFTER UPDATE ON resource_availability_override
BEGIN
    UPDATE resource_availability_override SET updated_at=CURRENT_TIMESTAMP WHERE resource_id=NEW.resource_id AND availability_id=NEW.availability_id;
END;


INSERT INTO availability (part_one, part_two, part_three, part_four, part_five, part_six)
VALUES (0,281474976710655,281474976710655,281474976710655,281474976710655,0);

INSERT INTO location (name, tz, default_availability_id) SELECT 'testlocation', 'Europe/Amsterdam', id from availability;

INSERT INTO resource(name, location_id, minimum_segments, maximum_segments, allow_invalid_segments, default_availability_id)
VALUES('testresource', (select id FROM location), 12, 24, false, (select id from availability))